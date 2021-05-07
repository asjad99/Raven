//
//  UIImageUtilities.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 2/4/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import "UIImageUtilities.h"

@implementation UIImageUtilities

+ (UIImage *)imageWithImage:(UIImage *)image scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height {
    CGFloat oldWidth = image.size.width;
    CGFloat oldHeight = image.size.height;
    
    CGFloat scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
    
    CGFloat newHeight = oldHeight * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    CGSize newSize = CGSizeMake(newWidth, newHeight);
    
    return [self imageWithImage:image scaledToSize:newSize];
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (UIImage *)imageWithOverlayColor:(UIColor *)color andSourceImage:(UIImage *)source_img
{
    
    // UIImage *temp = [UIImage imageNamed:@"halloween.jpg"];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, source_img.size.width, source_img.size.height);
    
    if (UIGraphicsBeginImageContextWithOptions) {
        CGFloat imageScale = 1.0f;
        if ([source_img respondsToSelector:@selector(scale)])  // The scale property is new with iOS4.
            imageScale = source_img.scale;
        UIGraphicsBeginImageContextWithOptions(source_img.size, NO, imageScale);
    }
    else {
        UIGraphicsBeginImageContext(source_img.size);
    }
    
    [source_img drawInRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/*
 + (UIImage *)roundedImageWithImage:(UIImage *)image {
 if (image) {
 CGContextRef cx = CGBitmapContextCreate(NULL, image.size.width, image.size.height, CGImageGetBitsPerComponent(image.CGImage), 0, CGImageGetColorSpace(image.CGImage), CGImageGetBitmapInfo(image.CGImage));
 
 CGContextBeginPath(cx);
 CGRect pathRect = CGRectMake(0, 0, image.size.width, image.size.height);
 CGContextAddEllipseInRect(cx, pathRect);
 CGContextClosePath(cx);
 CGContextClip(cx);
 
 CGContextDrawImage(cx, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
 
 CGImageRef clippedImage = CGBitmapContextCreateImage(cx);
 CGContextRelease(cx);
 
 UIImage *roundedImage = [UIImage imageWithCGImage:clippedImage];
 CGImageRelease(clippedImage);
 
 return roundedImage;
 }
 
 return nil;
 }*/

+ (UIImage *)roundedImageWithImage:(UIImage *)image {
    if (image) {
        CGContextRef cx = CGBitmapContextCreate(NULL, 50, 50, CGImageGetBitsPerComponent(image.CGImage), 0, CGImageGetColorSpace(image.CGImage), CGImageGetBitmapInfo(image.CGImage));
        
        CGContextBeginPath(cx);
        CGRect pathRect = CGRectMake(0, 0, 50, 50);
        CGContextAddEllipseInRect(cx, pathRect);
        CGContextClosePath(cx);
        CGContextClip(cx);
        
        CGContextDrawImage(cx, CGRectMake(0, 0, 50,50), image.CGImage);
        
        CGImageRef clippedImage = CGBitmapContextCreateImage(cx);
        CGContextRelease(cx);
        
        UIImage *roundedImage = [UIImage imageWithCGImage:clippedImage];
        CGImageRelease(clippedImage);
        
        return roundedImage;
    }
    
    return nil;
}

@end
