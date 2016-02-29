//
//  FoodNameListTableViewController.h
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TypeBlock)(NSString *str);
@interface FoodNameListTableViewController : UITableViewController

@property (nonatomic, strong) NSString *str;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, copy) TypeBlock typeBlock;

@end
