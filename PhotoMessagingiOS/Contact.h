//
//  Contact.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 2/12/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject


@property (nonatomic,strong) NSString *friendName;
@property (nonatomic,strong) NSString * UserID;
@property (nonatomic,strong) UIImage *friendAvatar;

//To be used while sending the message
@property (nonatomic) BOOL isSelected;


@end
