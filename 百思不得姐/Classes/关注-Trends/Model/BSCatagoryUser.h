//
//  BSCatagoryUser.h
//  百思不得姐
//
//  Created by 杨力 on 24/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSCatagoryUser : NSObject

/** 人数 */
@property (nonatomic,assign) NSInteger fans_count;

/** 头像 */
@property (nonatomic,copy) NSString * header;

/** 昵称 */
@property (nonatomic,copy) NSString * screen_name;


@end
