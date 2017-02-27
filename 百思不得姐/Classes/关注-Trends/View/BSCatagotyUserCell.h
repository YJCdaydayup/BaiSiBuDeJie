//
//  BSCatagotyUserCell.h
//  百思不得姐
//
//  Created by 杨力 on 24/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSCatagoryUser;

@interface BSCatagotyUserCell : UITableViewCell

/** 模型 */
@property (nonatomic,strong) BSCatagoryUser * user;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UIImageView *headerImgView;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end
