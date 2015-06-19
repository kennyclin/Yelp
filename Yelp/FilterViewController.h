//
//  FilterViewController.h
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)tapCancel:(UIButton *)sender;
- (IBAction)tapSearch:(UIButton *)sender;

@end
