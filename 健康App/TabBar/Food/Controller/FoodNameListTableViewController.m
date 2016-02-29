//
//  FoodNameListTableViewController.m
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import "FoodNameListTableViewController.h"
#import "FoodDetailController.h"
#import "FoodNameCell.h"
#import "AFNetworking.h"
#import "FoodName.h"
#import "UIImageView+WebCache.h"

#define FOODNAMEURL @"http://www.tngou.net/api/cook/list?id="
#define FOODIMAGE @"http://tnfs.tngou.net/img"

@interface FoodNameListTableViewController ()

@property (nonatomic, strong) NSMutableDictionary *mDic;
@property (nonatomic, strong) NSMutableArray *mArr;

@end

@implementation FoodNameListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = self.title;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FoodNameCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self getData];
}

// 网络请求获取数据
-(void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = [NSString stringWithFormat:@"%@%@",FOODNAMEURL,self.str];
    // 设置返回的数据类型为二进制数据流NSData
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 如果得到的数据为空,直接返回
        if (responseObject == nil) {
            return ;
        }
        
        // 二进制数据流JSON解析
        self.mDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *tngouArr = _mDic[@"tngou"];
        for (NSDictionary *dic in tngouArr) {
            FoodName *foodName = [[FoodName alloc]initWithDictionary:dic];
            [self.mArr addObject:foodName];
        }
        
        // 主线程更新数据
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error____%@", error);
    }];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _mArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodNameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    FoodName *foodName = _mArr[indexPath.row];
    
    cell.FoodNameLabel.text = foodName.name;
    // Configure the cell...
    NSString *str = foodName.img;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", FOODIMAGE,str]];
    
    [cell.foodImageView sd_setImageWithURL:url];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodDetailController *detailVC = [[FoodDetailController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
