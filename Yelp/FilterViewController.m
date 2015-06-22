//
//  FilterViewController.m
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterItemCell.h"

@interface FilterViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterItemCell" bundle:nil] forCellReuseIdentifier:@"FilterItemCell"];
    
   // [self.navigationItem.backBarButtonItem setEnabled:FALSE];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FilterItemCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FilterItemCell" forIndexPath:indexPath];
    cell.itemLabel.text=[NSString stringWithFormat:@"filter item %d",indexPath.row];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

// fixed font style. use custom view (UILabel) if you want something different
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Section %d", section];
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
}*/

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
