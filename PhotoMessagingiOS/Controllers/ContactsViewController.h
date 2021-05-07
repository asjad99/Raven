//
//  ContactsViewController.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/23/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic,strong) NSMutableArray * contactsList;

//@property (nonatomic,strong) IBOutlet UIButton *selectButton;


@property IBOutlet UISearchBar *contactSearchBar;

@property (strong,nonatomic) NSMutableArray *filteredContactsArray;

//@property (nonatomic, strong) IBOutlet UILabel *fullName;

-(IBAction)selectButtonOnTap:(id)sender;

@end
