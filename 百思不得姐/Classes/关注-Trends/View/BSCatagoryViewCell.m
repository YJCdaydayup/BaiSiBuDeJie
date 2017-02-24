//
//  BSCatagoryViewCell.m
//  百思不得姐
//
//  Created by 杨力 on 23/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSCatagoryViewCell.h"
#import "BSRecomendCatagory.h"

@interface BSCatagoryViewCell()

@property (weak, nonatomic) IBOutlet UIView *moveView;


@end

@implementation BSCatagoryViewCell

- (void)awakeFromNib {
    
    self.backgroundColor = BSGlobalBg;
    //    self.selectedBackgroundView = [[UIView alloc]init];
}

-(void)setCatagory:(BSRecomendCatagory *)catagory{
    
    //    _catagory = catagory;
    self.textLabel.text = catagory.name;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height-2*self.textLabel.y;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
    //选择另一个cell时，会默认将前一个的selected设置为NO，再将当前这个的selected设置为YES
    [super setSelected:selected animated:animated];
    self.moveView.hidden = !selected;
    self.textLabel.textColor = selected?self.moveView.backgroundColor:BSRGBColor(78, 78, 78);
    NSLog(@"%zi",selected);
}

@end
