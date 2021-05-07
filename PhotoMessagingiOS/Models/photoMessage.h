//
//  photoMessage.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/30/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface photoMessage : NSObject

@property (strong,nonatomic) UIImage * msgImage;
@property (strong,nonatomic) UIImage * msgAvatar;
@property (strong,nonatomic) NSString *timeStamp;
//TODO: Add image typei.e yours or mine

@end
