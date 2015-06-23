//
//  FilterItemCell.m
//  Yelp
//
//  Created by Kenny Lin on 6/22/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "FilterItemCell.h"

@interface FilterItemCell() <FilterItemCellDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;

@end

@implementation FilterItemCell
- (void)awakeFromNib {
    // Initialization code
    self.delegate=self;
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

-(void) filterItemCell:(FilterItemCell *)cell didUpdateValue:(BOOL) value{
    cell.itemModel.selected=value;
}

-(void) setItemModel:(FilterItem *)itemModel {
    _itemModel=itemModel;
    self.itemLabel.text=itemModel.title;
    [self setOn:itemModel.selected];
}

@end
