//
//  FilterViewController.m
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [self.navigationItem.backBarButtonItem setEnabled:FALSE];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationItem.backBarButtonItem setEnabled:FALSE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapCancel:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:FALSE];
}
- (IBAction)tapSearch:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
