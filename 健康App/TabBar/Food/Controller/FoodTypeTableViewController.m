//
//  FoodTypeTableViewController.m
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import "FoodTypeTableViewController.h"
#import "FoodTypeCell.h"
#import "FoodType.h"
#import "AFNetworking.h"
#import "FoodNameListTableViewController.h"
#import "FoodTypeManager.h"

#define FOODTYPEURL @"http://www.tngou.net/api/cook/classify?id=0"

@interface FoodTypeTableViewController ()
@property (nonatomic, strong) NSMutableDictionary *mDic;
@property (nonatomic, strong) NSMutableArray *mArr;

@property (nonatomic, strong) FoodTypeManager *manager;

@end

@implementation FoodTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [FoodTypeManager shareManager];
    
//    [self getData];
    [_manager requestFoodTypeDataWithview:self tableView:self.tableView];
    self.navigationItem.title = @"分类";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FoodTypeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
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
//    return _mArr.count;
    
    return [_manager foodTypeCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    FoodType *foodType = [_manager getFoodTypeIndex:indexPath.row];
    cell.foodTypeLabel.text = foodType.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodNameListTableViewController *listVC = [[FoodNameListTableViewController alloc] init];
    
    FoodType *foodType = [_manager getFoodTypeIndex:indexPath.row];
    
    listVC.str = [NSString stringWithFormat:@"%d", (int)foodType.foodTypeIdentifier];
    listVC.title = foodType.title;
    
    [self.navigationController pushViewController:listVC animated:YES];
}

@end
