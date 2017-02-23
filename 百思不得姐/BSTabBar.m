

//
//  BSBSTabBar.m
//  JFNetWorking
//
//  Created by 杨力 on 22/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSTabBar.h"

@interface BSTabBar()

@property (nonatomic,weak) UIButton * publishBtn;

@end

@implementation BSTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        UIButton * publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.publishBtn.frame = CGRectMake(0, 0, self.publishBtn.currentBackgroundImage.size.width, self.publishBtn.currentBackgroundImage.size.height);
    self.publishBtn.center = CGPointMake(self.width*0.5, self.height*0.5);
    
    CGFloat btnY = 0;
    CGFloat btnW = self.width/5;
    CGFloat btnH = self.height;
    NSInteger index = 0;
    for(UIView * btn in self.subviews){
        
        CGFloat btnX = btnW*(index>1?(index+1):index);
        if(![btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        index ++;
    }
}

@end
