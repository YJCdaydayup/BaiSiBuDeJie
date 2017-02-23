
//
//  BSTrendsController.m
//  JFNetWorking
//
//  Created by 杨力 on 22/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSTrendsController.h"
#import "UIBarButtonItem+BSExtension.h"
#import "BSRecommendController.h"

@interface BSTrendsController ()

@end

@implementation BSTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendClick)];
}

-(void)friendClick{
    
    BSRecommendController * vc = [[BSRecommendController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
