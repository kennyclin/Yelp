//
//  FilterItemCell.h
//  Yelp
//
//  Created by Kenny Lin on 6/22/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterItem.h"

@class FilterItemCell;

@protocol FilterItemCellDelegate <NSObject>

-(void) filterItemCell:(FilterItemCell *)cell didUpdateValue:(BOOL) value;


@end

@interface FilterItemCell : UITableViewCell


@property (weak, nonatomic) id<FilterItemCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (assign, nonatomic) BOOL on;
@property (strong, nonatomic) FilterItem *itemModel;

- (IBAction)switchValueChanged:(UISwitch *)sender;
-(void) setOn:(BOOL)on animated:(BOOL)animated;


@end
