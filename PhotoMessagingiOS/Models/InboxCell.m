//
//  InboxCell.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/13/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import "InboxCell.h"

@implementation InboxCell

@synthesize fromUserLabel;
@synthesize timeStampLabel;
//@synthesize receivedImageView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
