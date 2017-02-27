//
//  BSrecommendController.m
//  百思不得姐
//
//  Created by 杨力 on 23/2/2017.
//  Copyright © 2017 杨力. All rights reserved.
//

/*
 问题1.总是第一页数据
 问题2.重复发请求
 问题3.网速慢显示会出问题，造成误导
 */

#import "BSRecommendController.h"
#import <SVProgressHUD.h>
#import "BSRecomendCatagory.h"
#import <AFNetworking.h>
#import "BSCatagoryViewCell.h"
#import <MJExtension.h>
#import "BSCatagotyUserCell.h"
#import "BSCatagoryUser.h"
#import <MJRefreshAutoNormalFooter.h>
#import <MJRefreshHeader.h>

@interface BSRecommendController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

/** 左边的类别 */
@property (weak, nonatomic) IBOutlet UITableView *catagoryTableView;
@property (nonatomic,strong) NSArray<BSRecomendCatagory *> * catagories;
/** 右边的用户数据 */
@property (nonatomic,strong) NSArray * users;

@end

static NSString * const catagoryId = @"catagoryId";
static NSString * const catagoryUser = @"user";

#define BSSelectedCatagory self.catagories[self.catagoryTableView.indexPathForSelectedRow.row]

@implementation BSRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐关注";
    self.view.backgroundColor = BSGlobalBg;
    
    [self.userTableView.mj_header beginRefreshing];
    
    [self setUpTableView];
    
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
        [self createData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求数据错误!"];
    }];
}

/**
 * 添加刷新控件
 */
-(void)setupRefresh{
    
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [self createData];
    }];
    
    self.userTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
       
        [self createData];
    }];
    
    self.userTableView.mj_footer.hidden = YES;
    self.userTableView.mj_header.hidden = NO;
}

-(void)createData{
    
    BSRecomendCatagory * catagory = BSSelectedCatagory;
    
    NSDictionary * param = @{
                             @"a":@"list",
                             @"c":@"subscribe",
                             @"category_id":@([catagory id]),
                             @"page":@(++catagory.next_page)
                             };
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        NSArray * users = [BSCatagoryUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //添加到当前类别
        [BSSelectedCatagory.users addObjectsFromArray:users];
        BSSelectedCatagory.total = [responseObject[@"total"]integerValue];
        [self.userTableView reloadData];
        
        NSLog(@"%zi---%zi",catagory.users.count,catagory.total);
        
        if(catagory.users.count > catagory.total){
            [self.userTableView.mj_footer endRefreshingWithNoMoreData];
        }
        
        [self.userTableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求数据错误!"];
    }];
}

-(void)setUpTableView{
    
    //注册
    [self.catagoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSCatagoryViewCell class]) bundle:nil] forCellReuseIdentifier:catagoryId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSCatagotyUserCell class]) bundle:nil] forCellReuseIdentifier:catagoryUser];
    
    self.catagoryTableView.tableFooterView = [UIView new];
    self.catagoryTableView.backgroundColor = [UIColor clearColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.catagoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.catagoryTableView.contentInset;
    
    self.userTableView.rowHeight = 70;
    self.userTableView.tableFooterView = [UIView new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.catagoryTableView){
        return self.catagories.count;
    }else{
        
        BSRecomendCatagory * catagory = self.catagories[self.catagoryTableView.indexPathForSelectedRow.row];
        NSMutableArray * array = catagory.users;
        
        if(array.count){
            tableView.mj_footer.hidden = NO;
        }else{
            tableView.mj_footer.hidden = YES;
        }
        return array.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView == self.catagoryTableView){
        
        BSCatagoryViewCell * cell = [tableView dequeueReusableCellWithIdentifier:catagoryId];
        cell.catagory = self.catagories[indexPath.row];
        return cell;
    }else{
        
        BSCatagotyUserCell * cell = [tableView dequeueReusableCellWithIdentifier:catagoryUser];
        BSRecomendCatagory * catagory = self.catagories[self.catagoryTableView.indexPathForSelectedRow.row];
        cell.user = catagory.users[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //结束刷新
    [self.userTableView.mj_footer endRefreshing];
    [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    
    BSRecomendCatagory * user = [self.catagories objectAtIndex:indexPath.row];
    
    if(tableView == self.catagoryTableView){
        //如果曾经有数据
        if(user.users.count){
            
            //显示曾经的数据
            [self.userTableView reloadData];
        }else{
            
            [self.userTableView.mj_header beginRefreshing];
            //马上显示现在的数据，不要显示上一个的数据
            [self.userTableView reloadData];
            [self createData];
        }
    }
    
}

@end
