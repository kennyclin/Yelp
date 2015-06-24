//
//  SearchViewController.m
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "SearchViewController.h"
#import "YelpClient.h"
#import "Business.h"
#import "BusinessCell.h"
#import "FilterViewController.h"

@interface SearchViewController () <UITableViewDataSource, UITableViewDelegate, FilterViewDelegate>

@property (nonatomic, strong) YelpClient *yelpClient;
@property (nonatomic, strong) NSArray *businessList;
@property (nonatomic, weak) NSDictionary *filters;

@end

@implementation SearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar=[[UISearchBar alloc] init];
    self.navigationItem.titleView=self.searchBar;
    [self formatFilterButton];
    self.yelpClient=[[YelpClient alloc] initWithDefaultKey];
    [self applyFilter];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"BusinessCell" bundle:nil] forCellReuseIdentifier:@"BusinessCell"];
    //self.tableView.rowHeight=UITableViewAutomaticDimension;
}

-(void) applyFilter {
    NSDictionary *defaultFilter=@{@"term": @"Thai", @"ll" : @"37.774866,-122.394556"};   // Bay Area?
    if (self.filters==nil || self.filters.count==0){
        self.filters=defaultFilter;
    }
    if (self.yelpClient==nil) self.yelpClient=[[YelpClient alloc] initWithDefaultKey];
    [self.yelpClient searchWithTerms:self.filters success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"filters: %@", self.filters);
        NSLog(@"response: %@", response);
        NSArray *businessDictionaries=response[@"businesses"];
        self.businessList=[Business businessesWithDictionaries:businessDictionaries];
        // NSLog(@"businessList:%@", self.businessList);
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error description]);
    }];
    
}

-(void) formatFilterButton {
    self.filterButton.layer.cornerRadius = 8.0f;
    self.filterButton.layer.masksToBounds = NO;
    self.filterButton.layer.borderWidth = 1.0f;
    
    self.filterButton.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.filterButton.layer.shadowOpacity = 0.8;
    self.filterButton.layer.shadowRadius = 12;
    self.filterButton.layer.shadowOffset = CGSizeMake(20.0f, 20.0f);
}

// implmentation for UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.businessList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessCell *cell=[tableView dequeueReusableCellWithIdentifier:@"BusinessCell"];
    cell.businessModel=self.businessList[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) filterViewController:(FilterViewController *)controller didUpdateFilter:(NSDictionary *)filters{
    NSLog(@"%@", filters);
    self.filters=filters;
    [self applyFilter];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    FilterViewController *vc=[segue destinationViewController];
    vc.delegate=self;
}


@end
