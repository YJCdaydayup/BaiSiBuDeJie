

//
//  BSTagsCell.m
//  百思不得姐
//
//  Created by 杨力 on 24/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSTagsCell.h"
#import <UIImageView+WebCache.h>
#import "BSTagModel.m"

@implementation BSTagsCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(BSTagModel *)model{

    [self.tagImgView sd_setImageWithURL:[NSURL URLWithString:model.image_list]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
