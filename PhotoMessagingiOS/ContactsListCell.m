//
//  ContactsListCell.m
//  PhotoMessagingiOS
//
//  Created by Muhammad Asjad on 2/12/14.
//  Copyright (c) 2014 Muhammad Asjad. All rights reserved.
//

#import "ContactsListCell.h"

@implementation ContactsListCell

@synthesize fullName;
@synthesize userID;
@synthesize displayImage;
//@synthesize selectButton;
/*
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.fullName.text = @"askad";
        // Initialization code
    }
    return self;
}
*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/*
 UIButton *checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
 checkBox.tag = indexPath.row;
 checkBox.frame = CGRectMake(270,15, 20, 20);
 [cell.contentView addSubview:checkBox];
 [checkBox setImage:[UIImage imageNamed:@"selectedBoxWith.png"] forState:UIControlStateNormal];
 [checkBox addTarget:self action:@selector(checkBoxClicked:) forControlEvents:UIControlEventTouchUpInside];
 
 -(void)checkBoxClicked:(id)sender{
 if(self.isChecked ==NO){
 self.isChecked =YES;
 [sender  setImage:[UIImage imageNamed: @"selectedBoxWithTik.png"] forState:UIControlStateNormal];
 }else
 {
 self.isChecked =NO;
 [sender setImage:[UIImage imageNamed:@"selectedBoxWith.png"]forState:UIControlStateNormal];
 
 }
 }
*/

@end
