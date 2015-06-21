//
//  BusinessCell.m
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "BusinessCell.h"
#import "UIImageView+AFNetworking.h"
#import "Business.h"


@implementation BusinessCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setBusinessModel:(Business *)businessModel{
    _businessModel=businessModel;
    
    [self.thumbImageView setImageWithURL:[NSURL URLWithString:self.businessModel.imageUrl]];
    self.nameLabel.text=self.businessModel.name;
    self.distanceLabel.text=[NSString stringWithFormat:@"%.2f km", self.businessModel.distance];
    self.ratingLabel.text=[NSString stringWithFormat:@"%d Reviews", self.businessModel.reviewCount];
    [self.ratingImageView setImageWithURL:[NSURL URLWithString:self.businessModel.ratingImageUrl]];
    self.addressLabel.text=self.businessModel.address;
    self.categoryLabel.text=self.businessModel.categories;
    
}

@end
