//
//  ChatViewController.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/15/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;

+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width;
+(UIImage *)roundedImageWithImage:(UIImage *)image;

@end
