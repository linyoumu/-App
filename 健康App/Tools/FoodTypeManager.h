//
//  FoodTypeManager.h
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FoodType;
@class FoodTypeTableViewController;

@interface FoodTypeManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *mDic;
@property (nonatomic, strong) NSMutableArray *mArr;

+ (instancetype) shareManager;

// 加载分类数据
- (void) requestFoodTypeDataWithview:(FoodTypeTableViewController *) foodTypeVC tableView:(UITableView *) tableView;

// 返回总数据数
- (NSInteger) foodTypeCount;

// 返回数据模型
- (FoodType *) getFoodTypeIndex:(NSInteger)index;

@end
