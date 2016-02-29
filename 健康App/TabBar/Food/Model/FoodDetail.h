//
//  FoodDetail.h
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double fcount;
@property (nonatomic, assign) double internalFoodDetailIdentifier;
@property (nonatomic, strong) NSString *internalFoodDetailDescription;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *food;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *images;
@property (nonatomic, assign) BOOL status;
@property (nonatomic, assign) double rcount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
