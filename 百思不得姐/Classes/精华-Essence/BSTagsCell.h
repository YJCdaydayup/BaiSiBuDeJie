//
//  BSTagsCell.h
//  百思不得姐
//
//  Created by 杨力 on 24/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSTagModel;

@interface BSTagsCell : UITableViewCell

/** 模型 */
@property (nonatomic,strong) BSTagModel * model;
@property (weak, nonatomic) IBOutlet UIImageView *tagImgView;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end
