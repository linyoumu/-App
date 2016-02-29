//
//  FoodDetailController.m
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import "FoodDetailController.h"
#import "AFNetworking.h"
#import "FoodDetail.h"

@interface FoodDetailController ()

@property (nonatomic, strong) NSMutableDictionary *mDic;

@end

@implementation FoodDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self getData];
}

// 网络请求获取数据
-(void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置返回的数据类型为二进制数据流NSData
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://www.tngou.net/api/cook/show?id=183" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 如果得到的数据为空,直接返回
        if (responseObject == nil) {
            return ;
        }
        
        // 二进制数据流JSON解析
        self.mDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        // 主线程更新数据
        dispatch_async(dispatch_get_main_queue(), ^{
            FoodDetail *foodDetail = [[FoodDetail alloc]initWithDictionary:_mDic];
            self.nameLabel.text = foodDetail.name;
            self.detailLabel.text = foodDetail.message;
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error____%@", error);
    }];
}


- (NSMutableDictionary *)mDic
{
    if (_mDic == nil) {
        _mDic = [NSMutableDictionary dictionary];
    }
    return _mDic;
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
