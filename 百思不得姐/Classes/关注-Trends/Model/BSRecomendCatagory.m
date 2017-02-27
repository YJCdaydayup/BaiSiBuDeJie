

//
//  BSRecomendCatagory.m
//  百思不得姐
//
//  Created by 杨力 on 23/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSRecomendCatagory.h"

@implementation BSRecomendCatagory

-(NSMutableArray *)users{
    
    if(_users==nil){
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
