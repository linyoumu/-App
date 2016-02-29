//
//  FoodType.m
//  健康App
//
//  Created by lanou on 16/2/26.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import "FoodType.h"

NSString *const kFoodTypeId = @"id";
NSString *const kFoodTypeKeywords = @"keywords";
NSString *const kFoodTypeTitle = @"title";
NSString *const kFoodTypeCookclass = @"cookclass";
NSString *const kFoodTypeDescription = @"description";
NSString *const kFoodTypeName = @"name";
NSString *const kFoodTypeSeq = @"seq";


@interface FoodType ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FoodType

@synthesize foodTypeIdentifier = _foodTypeIdentifier;
@synthesize keywords = _keywords;
@synthesize title = _title;
@synthesize cookclass = _cookclass;
@synthesize foodTypeDescription = _foodTypeDescription;
@synthesize name = _name;
@synthesize seq = _seq;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.foodTypeIdentifier = [[self objectOrNilForKey:kFoodTypeId fromDictionary:dict] doubleValue];
        self.keywords = [self objectOrNilForKey:kFoodTypeKeywords fromDictionary:dict];
        self.title = [self objectOrNilForKey:kFoodTypeTitle fromDictionary:dict];
        self.cookclass = [[self objectOrNilForKey:kFoodTypeCookclass fromDictionary:dict] doubleValue];
        self.foodTypeDescription = [self objectOrNilForKey:kFoodTypeDescription fromDictionary:dict];
        self.name = [self objectOrNilForKey:kFoodTypeName fromDictionary:dict];
        self.seq = [[self objectOrNilForKey:kFoodTypeSeq fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.foodTypeIdentifier] forKey:kFoodTypeId];
    [mutableDict setValue:self.keywords forKey:kFoodTypeKeywords];
    [mutableDict setValue:self.title forKey:kFoodTypeTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cookclass] forKey:kFoodTypeCookclass];
    [mutableDict setValue:self.foodTypeDescription forKey:kFoodTypeDescription];
    [mutableDict setValue:self.name forKey:kFoodTypeName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seq] forKey:kFoodTypeSeq];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.foodTypeIdentifier = [aDecoder decodeDoubleForKey:kFoodTypeId];
    self.keywords = [aDecoder decodeObjectForKey:kFoodTypeKeywords];
    self.title = [aDecoder decodeObjectForKey:kFoodTypeTitle];
    self.cookclass = [aDecoder decodeDoubleForKey:kFoodTypeCookclass];
    self.foodTypeDescription = [aDecoder decodeObjectForKey:kFoodTypeDescription];
    self.name = [aDecoder decodeObjectForKey:kFoodTypeName];
    self.seq = [aDecoder decodeDoubleForKey:kFoodTypeSeq];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_foodTypeIdentifier forKey:kFoodTypeId];
    [aCoder encodeObject:_keywords forKey:kFoodTypeKeywords];
    [aCoder encodeObject:_title forKey:kFoodTypeTitle];
    [aCoder encodeDouble:_cookclass forKey:kFoodTypeCookclass];
    [aCoder encodeObject:_foodTypeDescription forKey:kFoodTypeDescription];
    [aCoder encodeObject:_name forKey:kFoodTypeName];
    [aCoder encodeDouble:_seq forKey:kFoodTypeSeq];
}

- (id)copyWithZone:(NSZone *)zone
{
    FoodType *copy = [[FoodType alloc] init];
    
    if (copy) {
        
        copy.foodTypeIdentifier = self.foodTypeIdentifier;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.cookclass = self.cookclass;
        copy.foodTypeDescription = [self.foodTypeDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.seq = self.seq;
    }
    
    return copy;
}
@end

