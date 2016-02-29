//
//  FoodName.m
//  健康App
//
//  Created by lanou on 16/2/26.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import "FoodName.h"

NSString *const kFoodNameRcount = @"rcount";
NSString *const kFoodNameImg = @"img";
NSString *const kFoodNameFcount = @"fcount";
NSString *const kFoodNameId = @"id";
NSString *const kFoodNameKeywords = @"keywords";
NSString *const kFoodNameImages = @"images";
NSString *const kFoodNameCount = @"count";
NSString *const kFoodNameDescription = @"description";
NSString *const kFoodNameName = @"name";
NSString *const kFoodNameFood = @"food";


@interface FoodName ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FoodName

@synthesize rcount = _rcount;
@synthesize img = _img;
@synthesize fcount = _fcount;
@synthesize foodNameIdentifier = _foodNameIdentifier;
@synthesize keywords = _keywords;
@synthesize images = _images;
@synthesize count = _count;
@synthesize foodNameDescription = _foodNameDescription;
@synthesize name = _name;
@synthesize food = _food;


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
        self.rcount = [[self objectOrNilForKey:kFoodNameRcount fromDictionary:dict] doubleValue];
        self.img = [self objectOrNilForKey:kFoodNameImg fromDictionary:dict];
        self.fcount = [[self objectOrNilForKey:kFoodNameFcount fromDictionary:dict] doubleValue];
        self.foodNameIdentifier = [[self objectOrNilForKey:kFoodNameId fromDictionary:dict] doubleValue];
        self.keywords = [self objectOrNilForKey:kFoodNameKeywords fromDictionary:dict];
        self.images = [self objectOrNilForKey:kFoodNameImages fromDictionary:dict];
        self.count = [[self objectOrNilForKey:kFoodNameCount fromDictionary:dict] doubleValue];
        self.foodNameDescription = [self objectOrNilForKey:kFoodNameDescription fromDictionary:dict];
        self.name = [self objectOrNilForKey:kFoodNameName fromDictionary:dict];
        self.food = [self objectOrNilForKey:kFoodNameFood fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rcount] forKey:kFoodNameRcount];
    [mutableDict setValue:self.img forKey:kFoodNameImg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fcount] forKey:kFoodNameFcount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.foodNameIdentifier] forKey:kFoodNameId];
    [mutableDict setValue:self.keywords forKey:kFoodNameKeywords];
    [mutableDict setValue:self.images forKey:kFoodNameImages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kFoodNameCount];
    [mutableDict setValue:self.foodNameDescription forKey:kFoodNameDescription];
    [mutableDict setValue:self.name forKey:kFoodNameName];
    [mutableDict setValue:self.food forKey:kFoodNameFood];
    
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
    
    self.rcount = [aDecoder decodeDoubleForKey:kFoodNameRcount];
    self.img = [aDecoder decodeObjectForKey:kFoodNameImg];
    self.fcount = [aDecoder decodeDoubleForKey:kFoodNameFcount];
    self.foodNameIdentifier = [aDecoder decodeDoubleForKey:kFoodNameId];
    self.keywords = [aDecoder decodeObjectForKey:kFoodNameKeywords];
    self.images = [aDecoder decodeObjectForKey:kFoodNameImages];
    self.count = [aDecoder decodeDoubleForKey:kFoodNameCount];
    self.foodNameDescription = [aDecoder decodeObjectForKey:kFoodNameDescription];
    self.name = [aDecoder decodeObjectForKey:kFoodNameName];
    self.food = [aDecoder decodeObjectForKey:kFoodNameFood];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_rcount forKey:kFoodNameRcount];
    [aCoder encodeObject:_img forKey:kFoodNameImg];
    [aCoder encodeDouble:_fcount forKey:kFoodNameFcount];
    [aCoder encodeDouble:_foodNameIdentifier forKey:kFoodNameId];
    [aCoder encodeObject:_keywords forKey:kFoodNameKeywords];
    [aCoder encodeObject:_images forKey:kFoodNameImages];
    [aCoder encodeDouble:_count forKey:kFoodNameCount];
    [aCoder encodeObject:_foodNameDescription forKey:kFoodNameDescription];
    [aCoder encodeObject:_name forKey:kFoodNameName];
    [aCoder encodeObject:_food forKey:kFoodNameFood];
}

- (id)copyWithZone:(NSZone *)zone
{
    FoodName *copy = [[FoodName alloc] init];
    
    if (copy) {
        
        copy.rcount = self.rcount;
        copy.img = [self.img copyWithZone:zone];
        copy.fcount = self.fcount;
        copy.foodNameIdentifier = self.foodNameIdentifier;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.count = self.count;
        copy.foodNameDescription = [self.foodNameDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.food = [self.food copyWithZone:zone];
    }
    
    return copy;
}


@end
