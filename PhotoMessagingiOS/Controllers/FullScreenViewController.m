//
//  FullScreenViewController.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/29/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import "FullScreenViewController.h"

@interface FullScreenViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation FullScreenViewController

@synthesize fullScreen_img;
@synthesize transferedImage;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

// -------------------------------------------------------------------------------
//viewDidLoad:
//Load the transfered image on view load
// -------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    fullScreen_img.image = transferedImage;
    fullScreen_img.contentMode = UIViewContentModeScaleAspectFit;
    
    self.scrollView.minimumZoomScale=0.5;
    self.scrollView.maximumZoomScale=6.0;
    self.scrollView.contentSize=CGSizeMake(1280, 960);
    self.scrollView.delegate=self;
}

// -------------------------------------------------------------------------------
//didReceiveMemoryWarning:
// -------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// -------------------------------------------------------------------------------
//viewForZoomingInScrollView:
// -------------------------------------------------------------------------------
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.fullScreen_img;
}

// -------------------------------------------------------------------------------
//Done:
//Dismiss FullscreenView on Done Button Tap
// -------------------------------------------------------------------------------
-(IBAction)Done:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
@end
