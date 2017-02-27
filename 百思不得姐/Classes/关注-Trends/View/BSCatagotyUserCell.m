//
//  BSCatagotyUserCell.m
//  百思不得姐
//
//  Created by 杨力 on 24/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSCatagotyUserCell.h"
#import "BSCatagoryUser.h"
#import <UIImageView+WebCache.h>

@implementation BSCatagotyUserCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUser:(BSCatagoryUser *)user{

    self.screenName.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zi",user.fans_count];
    [self.headerImgView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
