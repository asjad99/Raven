//
//  ContactsViewController.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/23/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactsListCell.h"
#import "Contact.h"
@interface ContactsViewController (){
    NSMutableArray *titleArray;
}

@end

@implementation ContactsViewController

@synthesize contactsList;
@synthesize filteredContactsArray;
//@synthesize fullName;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize the filteredCandyArray with a capacity equal to the candyArray's capacity
    
    self.contactsList = [[NSMutableArray alloc] init];
    
    Contact *myfriend_1 = [[Contact alloc] init];
    myfriend_1.friendName = @"asjad";
    [self.contactsList addObject:myfriend_1];
    
    Contact *myfriend_2 = [[Contact alloc] init];
    myfriend_2.friendName = @"khan";
    [self.contactsList addObject:myfriend_2];
    
    Contact *myfriend_3 = [[Contact alloc] init];
    myfriend_3.friendName = @"omer";
    [self.contactsList addObject:myfriend_3];
    
    Contact *myfriend_4 = [[Contact alloc] init];
    [self.contactsList addObject:myfriend_4];

    [self.contactsList sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"friendName" ascending:YES]]];
   
    self.filteredContactsArray = [NSMutableArray arrayWithCapacity:[self.contactsList count]];

    //Titles array:TODO: Take the contacts list,figure out the starting alphabets array
    titleArray = [[NSMutableArray alloc] initWithObjects:@"A",
                             @"B",
                             @"C",
                             @"D",
                             nil];
    //in case you want to return a new sorted array, use the following:
   // sortedArray = [anArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    // Uncomment the following line to preserve selection between presentations.
     //self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)selectButtonOnTap:(id)sender{
    UIButton *tappedButton = (UIButton*)sender;
    
    if([tappedButton.currentImage isEqual:[UIImage imageNamed:@"Circle.jpg"]]) {
        [sender  setImage:[UIImage imageNamed: @"CircleSelected.jpg"] forState:UIControlStateNormal];
    }
    
    else {
        [sender setImage:[UIImage imageNamed:@"Circle.jpg"]forState:UIControlStateNormal];
    }
    //  [self.selectButton setImage:[UIImage imageNamed:@"CircleSelected.jpg"] forState:UIControlStateNormal];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    #warning Potentially incomplete method implementation.
    //TODO: the number titles will euqal the length of the title's array.
    return 1;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  
    //TODO: Convert this into a for loop. that runs from 0 to length of title's array.
   if(section == 0)
    {
        return [titleArray objectAtIndex:0];
    }
    else if(section == 1)
    {
        return [titleArray objectAtIndex:1];
    }
    else
    {
        return [titleArray objectAtIndex:2];
    }
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 4;
    
  if (tableView == self.searchDisplayController.searchResultsTableView) {
      return 1;//[self.filteredContactsArray count];
    } else {
        return [self.contactsList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact *friend;
    //ContactsListCell *cell;
    UITableViewCell *cell;
    static NSString *CellIdentifier = @"ContactsListCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    //nameLabel.text = @"player.name";
    
    if ( cell == nil ) {
     
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ];
        
     //   cell = [[ContactsListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ];
      //  NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ContactsListCell" owner:self options:nil];
       // cell = [nib objectAtIndex:0];
        
    }
    

  if (tableView == self.searchDisplayController.searchResultsTableView) {
     //   friend = [self.filteredContactsArray objectAtIndex:indexPath.row];
      
        UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
        nameLabel.text = @"player.name";
      
      //  self.fullName.text = @"mytext";
       // cell.userID.text = friend.UserID;
        //cell.displayImage.image = friend.friendAvatar;
        
        //NSLog(@"count is %d",[self.filteredContactsArray count]);
        //for (Contact *friend2 in self.filteredContactsArray){
         //   NSLog(@"count is",friend2.friendName);
       // }
   
  } else {
        friend = [self.contactsList objectAtIndex:indexPath.row];
        UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
        nameLabel.text = @"search name";
       // self.fullName.text = friend.friendName;
       // cell.userID.text = friend.UserID;
        //cell.displayImage.image = friend.friendAvatar;
    }
   
    
    
    
    //in case you want a custom cell sperator, uncomment the following:
    /*
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // We have to use the borderColor/Width as opposed to just setting the
    // backgroundColor else the view becomes transparent and disappears during
    // the cell's selected/highlighted animation
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 1024, 1)];
    separatorView.layer.borderColor = [UIColor redColor].CGColor;
    separatorView.layer.borderWidth = 1.0;
    [cell.contentView addSubview:separatorView];
    */
    return cell;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredContactsArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.friendName contains[c] %@",searchText];
    filteredContactsArray = [NSMutableArray arrayWithArray:[self.contactsList filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
