//
//  BSRecomendCatagory.m
//  百思不得姐
//
//  Created by 杨力 on 23/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSRecomendCatagory.h"

@implementation BSRecomendCatagory

-(instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error{
    
    if(self = [super init]){
        
        self.id = dictionary[@"id"];
        self.name = dictionary[@"name"];
        self.count = dictionary[@"count"];
    }
    return self;
}

@end
