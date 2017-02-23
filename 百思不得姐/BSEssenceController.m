//
//  BSEssenceController.m
//  JFNetWorking
//
//  Created by 杨力 on 22/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSEssenceController.h"
#import "UIBarButtonItem+BSExtension.h"
#import "BSTestController.h"


@interface BSEssenceController ()

@end

@implementation BSEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(leftClick)];
    
    self.view.backgroundColor = BSGlobalBg;
    
}

-(void)leftClick{
    
    BSLogFunc;
    
    BSTestController * testVc = [BSTestController new];
    [self.navigationController pushViewController:testVc animated:YES];
    
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
