//
//  UIView+BSExtension.h
//  JFNetWorking
//
//  Created by 杨力 on 22/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BSExtension)

//分类中声明的变量，只会有方法的声明，set方法和get方法的声明

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;

@end
