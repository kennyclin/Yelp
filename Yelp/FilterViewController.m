//
//  FilterViewController.m
//  Yelp
//
//  Created by Kenny Lin on 6/20/15.
//  Copyright (c) 2015 ABU. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterItemCell.h"
#import "FilterItem.h"

@interface FilterViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (strong, nonatomic) NSArray *categories;
@property (strong, nonatomic) NSArray *sectionTitle;
@property (strong, nonatomic) NSMutableArray *sections;

-(void) initCategories;
-(void) initSections;
@end

@implementation FilterViewController

//does NOT get called !!! why???
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initCategories];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterItemCell" bundle:nil] forCellReuseIdentifier:@"FilterItemCell"];
    
    if (!self.sectionTitle){
        self.sectionTitle=@[@"", @"Distance", @"Sort By", @"Category"];
    }
    if (!self.sections){
        [self initSections];
    }
   // [self.navigationItem.backBarButtonItem setEnabled:FALSE];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *mysection=self.sections[section];
    return mysection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FilterItemCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FilterItemCell" forIndexPath:indexPath];
    NSArray *mysec=self.sections[indexPath.section];
    FilterItem *item=mysec[indexPath.row];
    cell.itemLabel.text=item.title;
    [cell setOn:item.selected];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections.count;
}

// fixed font style. use custom view (UILabel) if you want something different
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([self.sectionTitle[section] length]==0) return Nil;
    else return self.sectionTitle[section];
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
-(void) initSections{
    self.sections=[[NSMutableArray alloc] initWithCapacity:4];
    self.sections[0]=[[NSMutableArray alloc] initWithCapacity:1];
    self.sections[0][0]=[[FilterItem alloc] initWithValues:@"deals_filter" code:@"offeringDeal" title:@"Offering a Deal" checked:NO];
    
    //distance (radius)
    self.sections[1]=[[NSMutableArray alloc] initWithCapacity:5];
    self.sections[1][0]=[[FilterItem alloc] initWithValues:@"radius_filter" code:@"auto" title:@"Auto" checked:YES];
    self.sections[1][1]=[[FilterItem alloc] initWithValues:@"radius_filter" code:@0.5 title:@"0.5 km" checked:NO];
    self.sections[1][2]=[[FilterItem alloc] initWithValues:@"radius_filter" code:@1.5 title:@"1.5 km" checked:NO];
    self.sections[1][3]=[[FilterItem alloc] initWithValues:@"radius_filter" code:@5 title:@"5 km" checked:NO];
    self.sections[1][4]=[[FilterItem alloc] initWithValues:@"radius_filter" code:@10 title:@"10 km" checked:NO];
    
    //sort by ("best match", "distance", "highest rated")
    self.sections[2]=[[NSMutableArray alloc] initWithCapacity:3];
    self.sections[2][0]=[[FilterItem alloc] initWithValues:@"sort" code:@"0" title:@"Best Match" checked:YES];
    self.sections[2][1]=[[FilterItem alloc] initWithValues:@"sort" code:@"1" title:@"Distance" checked:NO];
    self.sections[2][2]=[[FilterItem alloc] initWithValues:@"sort" code:@"2" title:@"Highest Rated" checked:NO];
    
    [self initCategories];
    
}
-(void) initCategories{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString: @"https://raw.githubusercontent.com/Yelp/yelp-api/master/category_lists/en/category.json"]];
    [NSURLConnection sendAsynchronousRequest: request queue:[NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *connectionError){
        NSArray *topCates=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *dict=topCates[20];
        // looping categories!!!
        NSArray *allCateDict=dict[@"category"];
        NSMutableArray *categoryArray= [[NSMutableArray alloc] initWithCapacity:allCateDict.count];
        for (NSDictionary *cateDict in allCateDict){
            FilterItem *item=[[FilterItem alloc] initWithValues:@"category_filter" code:cateDict[@"alias"] title:cateDict[@"title"] checked:NO];
            [categoryArray addObject:item];
        }
        self.sections[3]=categoryArray;
        [self.tableView reloadData];
    }];

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
