//
//  InboxController.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/10/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//
#import "InboxController.h"
#import "InboxCell.h"
#import "Coversation.h"
@interface InboxController ()


@property (strong,nonatomic) NSMutableArray  *conversationsStream;

@end

@implementation InboxController

@synthesize conversationsStream;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

// -------------------------------------------------------------------------------
//	viewDidLoad:
// -------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
 
    
    self.conversationsStream = [NSMutableArray array];
    
    
    //adding dummy data to coversation stream....
    Coversation *conv = [[Coversation alloc] init];

    conv.timeStamp = @"Dec 21,2014 6:15";
    conv.fromUser = @"Hassan";
    
    [self.conversationsStream addObject:conv];
    
    Coversation *conv1 = [[Coversation alloc] init];
    
    conv1.timeStamp = @"Dec 21,2014 6:15";
    conv1.fromUser = @"Ahmad";
    
    [self.conversationsStream addObject:conv1];

    Coversation *conv2 = [[Coversation alloc] init];
    
    conv2.timeStamp = @"Dec 21,2014 6:15";
    conv2.fromUser = @"Ali";
    
    [self.conversationsStream addObject:conv2];

    Coversation *conv3 = [[Coversation alloc] init];
    
    conv3.timeStamp = @"Dec 21,2014 6:15";
    conv3.fromUser = @"Zohaid";
    
    [self.conversationsStream addObject:conv3];

    
    //conv.timeStampLabel

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source
// -------------------------------------------------------------------------------
//	numberOfSectionsInTableView:
// -------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

// -------------------------------------------------------------------------------
//	tableView:numberOfRowsInSection
// -------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.conversationsStream count];
}

// -------------------------------------------------------------------------------
//	tableView:numberOfRowsInSection
// -------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    InboxCell *cell = (InboxCell *)[tableView dequeueReusableCellWithIdentifier:@"inbox_cell" forIndexPath:indexPath];
    
    Coversation *tempConv  = [self.conversationsStream objectAtIndex:indexPath.row];
    
    cell.fromUserLabel.text = tempConv.fromUser;
    cell.timeStampLabel.text = tempConv.timeStamp;
    
    //  cell.receivedImageView.image = [UIImage imageNamed:@"abstract.jpg"];
    //Configure the cell...
    //cell.fr
    return cell;
}

// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        //[_chats removeObjectAtIndex:indexPath.row];
      //  [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [dataSourceArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


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
