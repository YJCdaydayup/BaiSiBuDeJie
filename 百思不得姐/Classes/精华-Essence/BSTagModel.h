//
//  BSTagModel.h
//  百思不得姐
//
//  Created by 杨力 on 24/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSTagModel : NSObject

//"theme_id": "163",
//"theme_name": "生活百科",
//"image_list": "http:%/%/img.spriteapp.cn%/ugc%/2015%/04%/23%/160559_24190.jpg",
//"sub_number": "36871",
//"is_sub": 0,
//"is_default": 0

/** 名称 */
@property (nonatomic,copy) NSString * theme_name;

/** 图片 */
@property (nonatomic,copy) NSString * image_list;

/** 订阅数 */
@property (nonatomic,copy) NSString * sub_number;

@end
