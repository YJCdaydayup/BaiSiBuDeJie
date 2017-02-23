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

-(instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error;

@end
