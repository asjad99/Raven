//
//  FullScreenViewController.h
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/29/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "photoMessage.h"

@interface FullScreenViewController : UIViewController <UIScrollViewDelegate>

@property  (strong,nonatomic) IBOutlet UIImageView *fullScreen_img;
@property  (strong,nonatomic) UIImage *transferedImage;

-(IBAction)Done:(id)sender;

@end
