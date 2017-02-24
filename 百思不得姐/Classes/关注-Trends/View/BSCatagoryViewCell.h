//
//  BSCatagoryViewCell.h
//  百思不得姐
//
//  Created by 杨力 on 23/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSRecomendCatagory;

@interface BSCatagoryViewCell : UITableViewCell

/** 模型属性 */
@property (nonatomic,strong) BSRecomendCatagory * catagory;

@end
