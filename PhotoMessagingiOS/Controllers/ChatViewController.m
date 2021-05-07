//
//  ChatViewController.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 1/15/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import "ChatViewController.h"
#import "FullScreenViewController.h"
#import "photoMessage.h"
#import "UIImage+Alpha.h"
#import "UIImageUtilities.h"


#define kChatBarHeight1    40
#define kChatBarHeight4    94

@interface ChatViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray  *photoStreamArray;
@property (strong,nonatomic) UIImage *transferImage;

@end

@implementation ChatViewController

@synthesize tableView=_tableView;
@synthesize photoStreamArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

// -------------------------------------------------------------------------------
//	viewDidLoad:
// -------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Create _tableView to display messages.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height-kChatBarHeight1)];
    _tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithRed:0.859 green:0.886 blue:0.929 alpha:1];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.photoStreamArray = [NSMutableArray array];
    photoMessage *msg = [[photoMessage alloc] init];
    msg.msgImage = [UIImage imageNamed:@"halloween.jpg"];
    msg.msgAvatar = [UIImage imageNamed:@"me.jpg"];
    msg.timeStamp = @"Dec 21,2014 6:15";
    
    [self.photoStreamArray addObject:msg];
    
    photoMessage *msg2 = [[photoMessage alloc] init];
    msg2.msgImage = [UIImage imageNamed:@"landscape.jpg"];
    msg2.msgAvatar = [UIImage imageNamed:@"me2.jpg"];
    msg2.timeStamp = @"Dec 22,2014 6:15";;
    
    [self.photoStreamArray addObject:msg2];
    
    photoMessage *msg3 = [[photoMessage alloc] init];
    msg3.msgImage = [UIImage imageNamed:@"nature.jpg"];
    msg3.msgAvatar = [UIImage imageNamed:@"me.jpg"];
    msg3.timeStamp = @"Dec 23,2014 6:15";;
    
    [self.photoStreamArray addObject:msg3];
    
    photoMessage *msg4 = [[photoMessage alloc] init];
    msg4.msgImage = [UIImage imageNamed:@"halloween.jpg"];//abstract.jpg
    msg4.msgAvatar = [UIImage imageNamed:@"me2.jpg"];
    msg4.timeStamp = @"Dec 24,2014 6:15";;
    
    [self.photoStreamArray addObject:msg4];
    
    
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate
// -------------------------------------------------------------------------------
//	tableView:heightForRowAtIndexPath
// -------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    photoMessage *temp_msg = [self.photoStreamArray objectAtIndex:indexPath.row];
    UIImage *img = temp_msg.msgImage;
    
    img = [UIImageUtilities imageWithImage:img
                      scaledToMaxWidth:220
                             maxHeight:220];
    return img.size.height + 25;
}

#pragma mark - UITableViewDataSource
// -------------------------------------------------------------------------------
//	tableView:commitEditingStyle:forRowAtIndexPath
// -------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
      //  [self.dataArray removeObjectAtIndex:indexPath.row];
    }
}

// -------------------------------------------------------------------------------
//	tableView:canEditRowAtIndexPath
// -------------------------------------------------------------------------------
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// -------------------------------------------------------------------------------
//	tableView:numberOfRowsInSection
// -------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

int img_index = 0;
// -------------------------------------------------------------------------------
//	tableView:cellForRowAtIndexPath
// -------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    photoMessage *msg;
    UIImageView *photoMessage;
    UIImageView *avatar;
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    msg = [self.photoStreamArray objectAtIndex:indexPath.row];
    
    UIImage *img = msg.msgImage;
    UIImage *avatar_img = msg.msgAvatar;
    
    img = [UIImageUtilities imageWithImage:img
                      scaledToMaxWidth:220
                             maxHeight:220];
     CGSize size = img.size;
   
    //avatar_img = [[self class] imageWithImage:avatar_img
      //                scaledToMaxWidth:5550
        //                     maxHeight:50];
    
    avatar_img = [avatar_img imageWithAlpha];
    avatar_img = [UIImageUtilities roundedImageWithImage:avatar_img];
    
    NSString *timeStamp = msg.timeStamp;
   
    photoMessage = [[UIImageView alloc] initWithImage:img];
    photoMessage.contentMode = UIViewContentModeScaleAspectFit;
    photoMessage.layer.cornerRadius = 4.0;
    photoMessage.layer.masksToBounds = YES;
    photoMessage.tag = img_index;
    photoMessage.userInteractionEnabled = YES;
    img_index++;
    
    
    // photoMessage.frame = imageViewFrame;
    if (indexPath.row%2 == 0){
        
        //UIImage *colored_img = [self imageWithOverlayColor:[UIColor blackColor] andSourceImage:img];
        
        //frame take x,y and width height
        //x here is avtar width + white spaces,while y is random.
        photoMessage.frame = CGRectMake(70,10,size.width, size.height);
        
        //Add Gesture Recongnizer to the image
        
        avatar = [[UIImageView alloc] initWithImage:avatar_img];
        avatar.frame = CGRectMake(10,size.height - 30,50,50);
        
        UILabel *dateLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(70,size.height + 10,100,10)];
        dateLabel.text = timeStamp;
        dateLabel.textAlignment =  UITextAlignmentLeft;
        dateLabel.textColor = [UIColor blackColor];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.font = [UIFont fontWithName:@"Arial" size:(9.0)];
        [cell.contentView addSubview:dateLabel];
    }
    else{
        
        CGSize size = img.size;
        
        //x position is frame width - image width - avatar width - white spaces in between, y is white space from left from top
        
        photoMessage.frame = CGRectMake(320 - size.width - 70,10,size.width,size.height);
        
        //x postion is frame width - avatar width - white spaces in between
        //y postion is photo height - avatar height + space left at top at the current cell frame + some extra space to keep it below
        avatar = [[UIImageView alloc] initWithImage:avatar_img];
        avatar.frame = CGRectMake(320 - 60,size.height - 50 + 20,50,50);
        
        //x position is frame width - avatar width - whitespaces - date width
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(320 - 70 - 70,size.height + 10,100,10) ];
        dateLabel.text = timeStamp;
        dateLabel.textAlignment =  UITextAlignmentLeft;
        dateLabel.textColor = [UIColor blackColor];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.font = [UIFont fontWithName:@"Arial" size:(9.0)];
        [cell.contentView addSubview:dateLabel];
        
    }
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    gesture.minimumPressDuration = 1.0;
    gesture.allowableMovement = 600;
    
    [photoMessage addGestureRecognizer:gesture];
    
    avatar.contentMode = UIViewContentModeScaleAspectFit;
   // avatar.layer.cornerRadius = 28.0;
    avatar.layer.masksToBounds = YES;
    
    [cell.contentView addSubview:photoMessage];
    [cell.contentView addSubview:avatar];
    return cell;
    
}

int image_tag_id = 0;


// -------------------------------------------------------------------------------
// handleGesture
// handles tap by showing the tapped image in full screen view
// -------------------------------------------------------------------------------
- (void)handleGesture:(UILongPressGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
        [self performSegueWithIdentifier:@"to_fullScreenView"sender:self];
        
    }
    //fetch the tag of the tapped image;
    image_tag_id =((UILongPressGestureRecognizer *)sender).view.tag;
    //  NSLog(@"image tapped!!! %d", image_tag_id);
    
}

// -------------------------------------------------------------------------------
// prepareForSegue
// handles tap by showing the tapped image in full screen view
// -------------------------------------------------------------------------------
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"to_fullScreenView"]){
        
        FullScreenViewController *FC_Controller = (FullScreenViewController *)segue.destinationViewController;
        photoMessage *temp = [self.photoStreamArray objectAtIndex:image_tag_id];
        FC_Controller.transferedImage = temp.msgImage;
    }
}

@end
