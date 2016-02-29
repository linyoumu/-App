//
//  FoodType.h
//  健康App
//
//  Created by lanou on 16/2/26.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodType : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double foodTypeIdentifier;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double cookclass;
@property (nonatomic, strong) NSString *foodTypeDescription;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double seq;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
