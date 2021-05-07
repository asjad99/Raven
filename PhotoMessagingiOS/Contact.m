//
//  Contact.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 2/12/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import "Contact.h"

@implementation Contact


@synthesize  friendAvatar;
@synthesize friendName;
@synthesize UserID;
@synthesize isSelected;

- (id) init{
    
    if (self = [super init]) {
            self.friendName = @"zohaib";
            self.UserID = @"xrl123";
            self.isSelected = NO;
        self.friendAvatar = [UIImage imageNamed:@"icon_image.png"];
    }
    return self;
}


@end
