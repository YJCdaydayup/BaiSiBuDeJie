
//
//  BSTabbarController.m
//  JFNetWorking
//
//  Created by 杨力 on 22/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSTabbarController.h"
#import "BSEssenceController.h"
#import "BSMeController.h"
#import "BSNewController.h"
#import "BSTrendsController.h"
#import "BSTabBar.h"
#import "BSNaviController.h"

@interface BSTabbarController ()

@end

@implementation BSTabbarController

+(void)initialize{
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    BSEssenceController * vc1 = [BSEssenceController new];
    [self configViewControler:vc1 title:@"精华" norImg:@"tabBar_essence_icon" selImg:@"tabBar_essence_click_icon"];
    
    BSNewController * vc2 = [BSNewController new];
    [self configViewControler:vc2 title:@"新帖" norImg:@"tabBar_new_icon" selImg:@"tabBar_new_click_icon"];
    
    BSTrendsController * vc3 = [BSTrendsController new];
    [self configViewControler:vc3 title:@"关注" norImg:@"tabBar_friendTrends_icon" selImg:@"tabBar_friendTrends_click_icon"];
    
    BSMeController * vc4 = [BSMeController new];
    [self configViewControler:vc4 title:@"我" norImg:@"tabBar_me_icon" selImg:@"tabBar_me_click_icon"];
    
    //tabbar
    [self setValue:[BSTabBar new] forKeyPath:@"tabBar"];
    
}

-(void)configViewControler:(UIViewController *)vc title:(NSString *)title norImg:(NSString *)norImg selImg:(NSString *)selImg{

    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:norImg];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selImg];

    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    BSNaviController * nvc = [[BSNaviController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nvc];
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
