//
//  Business.h
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Business : NSObject

@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *ratingImageUrl;
@property (assign, nonatomic) NSInteger reviewCount;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *categories;
@property (assign, nonatomic) CGFloat distance;

-(id) initWithDictionary:(NSDictionary *) dictionary;
+ (NSArray *) businessesWithDictionaries: (NSArray *) dictionaries;


@end
