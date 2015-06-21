//
//  Business.m
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "Business.h"

@implementation Business

-(id) initWithDictionary:(NSDictionary *) dictionary{
    self=[super init];
    if (self){
        NSArray *categories=dictionary[@"categories"];
        NSMutableArray *categoryNames=[NSMutableArray array];
        [categories enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [categoryNames addObject:obj[0]];
        }];
        self.categories=[categoryNames componentsJoinedByString:@", "];
        self.name=dictionary[@"name"];
        self.imageUrl=dictionary[@"image_url"];
        NSString *street=[dictionary valueForKeyPath:@"location.address"][0];
        NSString *neighborhood=[dictionary valueForKeyPath:@"location.neighborhoods"][0];
        self.address=[NSString stringWithFormat:@"%@, %@", street, neighborhood];
        self.reviewCount=[dictionary[@"review_count"] integerValue];
        self.ratingImageUrl=dictionary[@"rating_img_url"];
        self.distance=[dictionary[@"distance"] floatValue] / 1000.0; //show KM
    }
    return self;
}
+ (NSArray *) businessesWithDictionaries: (NSArray *) dictionaries{
    NSMutableArray *result=[NSMutableArray array];
    Business *business;
    for (NSDictionary *dict in dictionaries){
        business=[[Business alloc] initWithDictionary:dict];
        [result addObject:business];
    }
    return result;
}

@end
