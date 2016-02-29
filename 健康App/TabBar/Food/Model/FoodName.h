//
//  FoodName.h
//  健康App
//
//  Created by lanou on 16/2/26.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodName : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double rcount;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double fcount;
@property (nonatomic, assign) double foodNameIdentifier;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *images;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *foodNameDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *food;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
