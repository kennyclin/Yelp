//
//  FilterItemCell.m
//  Yelp
//
//  Created by Kenny Lin on 6/22/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "FilterItemCell.h"

@interface FilterItemCell()

@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;

@end

@implementation FilterItemCell
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setOn:(BOOL)on{
    [self setOn:on animated:NO];
}

-(void) setOn:(BOOL)on animated:(BOOL) animated{
    _on=on;
    [self.toggleSwitch setOn:on animated:animated];
}

- (IBAction)switchValueChanged:(UISwitch *)sender {
    [self.delegate filterItemCell:self didUpdateValue:self.toggleSwitch.on];
}
@end
