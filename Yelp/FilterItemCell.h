//
//  FilterItemCell.h
//  Yelp
//
//  Created by Kenny Lin on 6/22/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
- (IBAction)switchValueChanged:(UISwitch *)sender;

@end
