//
//  BSrecommendController.m
//  百思不得姐
//
//  Created by 杨力 on 23/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

#import "BSRecommendController.h"
#import <SVProgressHUD.h>
#import "BSRecomendCatagory.h"
#import <AFNetworking.h>
#import "BSCatagoryViewCell.h"
#import <MJExtension.h>


@interface BSRecommendController ()<UITableViewDataSource,UITableViewDelegate>

/** 左边的类别 */
@property (weak, nonatomic) IBOutlet UITableView *catagoryTableView;
@property (nonatomic,strong) NSArray * catagories;

@end

static NSString * const catagoryId = @"catagoryId";

@implementation BSRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐关注";
    self.view.backgroundColor = BSGlobalBg;
    
    //注册
    [self.catagoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSCatagoryViewCell class]) bundle:nil] forCellReuseIdentifier:catagoryId];
    self.catagoryTableView.tableFooterView = [UIView new];
    self.catagoryTableView.backgroundColor = [UIColor clearColor];
    
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    NSDictionary * dict = @{@"a":@"category",@"c":@"subscribe"};
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        self.catagories = [BSRecomendCatagory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.catagoryTableView reloadData];
        
        [self.catagoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求数据错误!"];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.catagories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BSCatagoryViewCell * cell = [tableView dequeueReusableCellWithIdentifier:catagoryId];
    if(cell==nil){
        cell = [[BSCatagoryViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:catagoryId];
    }
    cell.catagory = self.catagories[indexPath.row];
    
    return cell;
}

@end
