//
//  FilterItem.m
//  Yelp
//
//  Created by Kenny Lin on 6/23/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "FilterItem.h"

@implementation FilterItem

-(id) initWithValues:(NSString*) key code:(NSObject *)code title:(NSString *)title checked:(BOOL)defaultSelected{
    self=[super init];
    if (self){
        _key=key;
        _code=code;
        _title=title;
        _selected=defaultSelected;
        _justOn=NO;
    }
    return self;
}
@end
