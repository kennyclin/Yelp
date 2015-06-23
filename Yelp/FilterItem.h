//
//  FilterItem.h
//  Yelp
//
//  Created by Kenny Lin on 6/23/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterItem : NSObject

@property (weak, nonatomic) NSString* key;
@property (strong, nonatomic) NSObject* code;
@property (strong, nonatomic) NSString* title;
@property (assign, nonatomic) BOOL selected;

-(id) initWithValues:(NSString*) key code:(NSObject*) code title:(NSString*) title checked:(BOOL) defaultSelected;

@end
