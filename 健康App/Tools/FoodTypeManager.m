//
//  FoodTypeManager.m
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import "FoodTypeManager.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "AFNetworking.h"
#import "FoodType.h"

#define FOODTYPEURL @"http://www.tngou.net/api/cook/classify?id=0"

@implementation FoodTypeManager

+ (instancetype) shareManager{
    static FoodTypeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[FoodTypeManager alloc] init];
        }
    });
    return manager;
}

- (void)requestFoodTypeDataWithview:(FoodTypeTableViewController *)foodTypeVC tableView:(UITableView *)tableView
{
    if ([self isnetWork]) {
        [self getDataTableView:tableView];
        
    }else{
        NSLog(@"0000");
    }
}

// 网络请求获取数据
-(void)getDataTableView:(UITableView *)tableView{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置返回的数据类型为二进制数据流NSData
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:FOODTYPEURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 如果得到的数据为空,直接返回
        if (responseObject == nil) {
            return ;
        }
        
        // 二进制数据流JSON解析
        self.mDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *tngouArr = _mDic[@"tngou"];
        
        for (NSDictionary *dic in tngouArr) {
            FoodType *foodType = [[FoodType alloc]initWithDictionary:dic];
            [self.mArr addObject:foodType];
            
            NSLog(@"%@", foodType.title);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [tableView reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error____%@", error);
    }];
}

- (NSInteger) foodTypeCount
{
    return _mArr.count;
}

- (FoodType *)getFoodTypeIndex:(NSInteger)index
{
    return _mArr[index];
}

- (BOOL) isnetWork
{
    BOOL isNetWork;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            NSLog(@"没网络");
            isNetWork = NO;
            break;
        case ReachableViaWiFi:
            isNetWork = YES;
            break;
        case ReachableViaWWAN:
            isNetWork = YES;
            break;
        default:
            break;
    }
    return isNetWork;
}

- (NSMutableArray *)mArr
{
    if (_mArr == nil) {
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}

- (NSMutableDictionary *)mDic
{
    if (_mDic == nil) {
        _mDic = [NSMutableDictionary dictionary];
    }
    return _mDic;
}

@end
