//
//  ContactsListCell.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 2/12/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsListCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *fullName;
@property (nonatomic, strong) IBOutlet UILabel *userID;
@property (nonatomic, strong) IBOutlet UIImageView *displayImage;



@end
