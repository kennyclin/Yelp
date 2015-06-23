//
//  FilterViewController.h
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterViewController;

@protocol FilterViewDelegate <NSObject>

-(void) filterViewController:(FilterViewController *) controller didUpdateFilter:(NSDictionary*) filters;

@end

@interface FilterViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *filters;
@property (weak, nonatomic) id<FilterViewDelegate> delegate;

- (IBAction)tapCancel:(UIButton *)sender;
- (IBAction)tapSearch:(UIButton *)sender;


@end
