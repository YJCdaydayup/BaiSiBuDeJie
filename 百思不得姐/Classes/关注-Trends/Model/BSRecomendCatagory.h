//
//  BSRecomendCatagory.h
//  百思不得姐
//
//  Created by 杨力 on 23/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSRecomendCatagory : NSObject

/** id */
@property (nonatomic,assign) NSInteger id;

/** 总数 */
@property (nonatomic,assign) NSInteger count;

/** 名称 */
@property (nonatomic,copy) NSString * name;

/** 下一页 */
@property (nonatomic,assign) NSInteger next_page;

/** 总页数 */
@property (nonatomic,assign) NSInteger total_page;

/** 总数 */
@property (nonatomic,assign) NSInteger total;


/** 当前页码 */
@property (nonatomic,assign) NSInteger current_page;

/** 这个类别对应的数据 */
@property (nonatomic,strong) NSMutableArray * users;

@end
