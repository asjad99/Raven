//
//  InboxCell.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/13/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *fromUserLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeStampLabel;

//@property (nonatomic, strong) IBOutlet UIImageView *receivedImageView;

@end
