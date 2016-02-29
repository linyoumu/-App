//
//  FoodDetail.m
//  健康App
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 linyoumu. All rights reserved.
//

#import "FoodDetail.h"

NSString *const kFoodDetailFcount = @"fcount";
NSString *const kFoodDetailId = @"id";
NSString *const kFoodDetailDescription = @"description";
NSString *const kFoodDetailMessage = @"message";
NSString *const kFoodDetailName = @"name";
NSString *const kFoodDetailCount = @"count";
NSString *const kFoodDetailFood = @"food";
NSString *const kFoodDetailUrl = @"url";
NSString *const kFoodDetailImg = @"img";
NSString *const kFoodDetailKeywords = @"keywords";
NSString *const kFoodDetailImages = @"images";
NSString *const kFoodDetailStatus = @"status";
NSString *const kFoodDetailRcount = @"rcount";


@interface FoodDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FoodDetail

@synthesize fcount = _fcount;
@synthesize internalFoodDetailIdentifier = _internalFoodDetailIdentifier;
@synthesize internalFoodDetailDescription = _internalFoodDetailDescription;
@synthesize message = _message;
@synthesize name = _name;
@synthesize count = _count;
@synthesize food = _food;
@synthesize url = _url;
@synthesize img = _img;
@synthesize keywords = _keywords;
@synthesize images = _images;
@synthesize status = _status;
@synthesize rcount = _rcount;


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
        self.fcount = [[self objectOrNilForKey:kFoodDetailFcount fromDictionary:dict] doubleValue];
        self.internalFoodDetailIdentifier = [[self objectOrNilForKey:kFoodDetailId fromDictionary:dict] doubleValue];
        self.internalFoodDetailDescription = [self objectOrNilForKey:kFoodDetailDescription fromDictionary:dict];
        self.message = [self objectOrNilForKey:kFoodDetailMessage fromDictionary:dict];
        self.name = [self objectOrNilForKey:kFoodDetailName fromDictionary:dict];
        self.count = [[self objectOrNilForKey:kFoodDetailCount fromDictionary:dict] doubleValue];
        self.food = [self objectOrNilForKey:kFoodDetailFood fromDictionary:dict];
        self.url = [self objectOrNilForKey:kFoodDetailUrl fromDictionary:dict];
        self.img = [self objectOrNilForKey:kFoodDetailImg fromDictionary:dict];
        self.keywords = [self objectOrNilForKey:kFoodDetailKeywords fromDictionary:dict];
        self.images = [self objectOrNilForKey:kFoodDetailImages fromDictionary:dict];
        self.status = [[self objectOrNilForKey:kFoodDetailStatus fromDictionary:dict] boolValue];
        self.rcount = [[self objectOrNilForKey:kFoodDetailRcount fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fcount] forKey:kFoodDetailFcount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalFoodDetailIdentifier] forKey:kFoodDetailId];
    [mutableDict setValue:self.internalFoodDetailDescription forKey:kFoodDetailDescription];
    [mutableDict setValue:self.message forKey:kFoodDetailMessage];
    [mutableDict setValue:self.name forKey:kFoodDetailName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kFoodDetailCount];
    [mutableDict setValue:self.food forKey:kFoodDetailFood];
    [mutableDict setValue:self.url forKey:kFoodDetailUrl];
    [mutableDict setValue:self.img forKey:kFoodDetailImg];
    [mutableDict setValue:self.keywords forKey:kFoodDetailKeywords];
    [mutableDict setValue:self.images forKey:kFoodDetailImages];
    [mutableDict setValue:[NSNumber numberWithBool:self.status] forKey:kFoodDetailStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rcount] forKey:kFoodDetailRcount];
    
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
    
    self.fcount = [aDecoder decodeDoubleForKey:kFoodDetailFcount];
    self.internalFoodDetailIdentifier = [aDecoder decodeDoubleForKey:kFoodDetailId];
    self.internalFoodDetailDescription = [aDecoder decodeObjectForKey:kFoodDetailDescription];
    self.message = [aDecoder decodeObjectForKey:kFoodDetailMessage];
    self.name = [aDecoder decodeObjectForKey:kFoodDetailName];
    self.count = [aDecoder decodeDoubleForKey:kFoodDetailCount];
    self.food = [aDecoder decodeObjectForKey:kFoodDetailFood];
    self.url = [aDecoder decodeObjectForKey:kFoodDetailUrl];
    self.img = [aDecoder decodeObjectForKey:kFoodDetailImg];
    self.keywords = [aDecoder decodeObjectForKey:kFoodDetailKeywords];
    self.images = [aDecoder decodeObjectForKey:kFoodDetailImages];
    self.status = [aDecoder decodeBoolForKey:kFoodDetailStatus];
    self.rcount = [aDecoder decodeDoubleForKey:kFoodDetailRcount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeDouble:_fcount forKey:kFoodDetailFcount];
    [aCoder encodeDouble:_internalFoodDetailIdentifier forKey:kFoodDetailId];
    [aCoder encodeObject:_internalFoodDetailDescription forKey:kFoodDetailDescription];
    [aCoder encodeObject:_message forKey:kFoodDetailMessage];
    [aCoder encodeObject:_name forKey:kFoodDetailName];
    [aCoder encodeDouble:_count forKey:kFoodDetailCount];
    [aCoder encodeObject:_food forKey:kFoodDetailFood];
    [aCoder encodeObject:_url forKey:kFoodDetailUrl];
    [aCoder encodeObject:_img forKey:kFoodDetailImg];
    [aCoder encodeObject:_keywords forKey:kFoodDetailKeywords];
    [aCoder encodeObject:_images forKey:kFoodDetailImages];
    [aCoder encodeBool:_status forKey:kFoodDetailStatus];
    [aCoder encodeDouble:_rcount forKey:kFoodDetailRcount];
}

- (id)copyWithZone:(NSZone *)zone
{
    FoodDetail *copy = [[FoodDetail alloc] init];
    
    if (copy) {
        
        copy.fcount = self.fcount;
        copy.internalFoodDetailIdentifier = self.internalFoodDetailIdentifier;
        copy.internalFoodDetailDescription = [self.internalFoodDetailDescription copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.count = self.count;
        copy.food = [self.food copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.status = self.status;
        copy.rcount = self.rcount;
    }
    
    return copy;
}


@end
