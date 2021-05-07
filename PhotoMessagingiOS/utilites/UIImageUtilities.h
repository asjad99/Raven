//
//  UIImageUtilities.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 2/4/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageUtilities : NSObject


+ (UIImage *)imageWithImage:(UIImage *)image scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size;
+ (UIImage *)imageWithOverlayColor:(UIColor *)color andSourceImage:(UIImage *)source_img;
+ (UIImage *)roundedImageWithImage:(UIImage *)image;


@end
