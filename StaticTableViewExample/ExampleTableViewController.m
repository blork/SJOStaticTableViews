//
//  ExampleTableViewController.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "ExampleTableViewController.h"
#import "ExampleViewController.h"
#import "SJOStaticTableViewDataSource.h"
#import "SJOStaticCell.h"
#import "SJOStaticSection.h"

@interface ExampleTableViewController ()
@property (nonatomic, strong) SJOStaticTableViewDataSource *staticTableViewDataSource;
@end

@implementation ExampleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[SJOStaticTableViewDataSource cellIdentifier]];
        
        __weak ExampleTableViewController* weakSelf = self;

        SJOStaticCell *cell1 = [SJOStaticCell cellWithTitle:@"Switch Cell" andControl:[[UISwitch alloc] init]];
        SJOStaticCell *cell2 = [SJOStaticCell cellWithTitle:@"Block Cell" andActionBlock:^id(SJOStaticCell *cell, UIViewController *controller) {
            [weakSelf.navigationController pushViewController:[[ExampleViewController alloc] init] animated:YES];
            return nil;
        }];
        SJOStaticCell *cell3 = [SJOStaticCell cellWithTitle:@"Slider Cell" andControl:[[UISlider alloc] init]];
        SJOStaticCell *cell4 = [SJOStaticCell cellWithTitle:@"Button Cell" andControl:[UIButton buttonWithType:UIButtonTypeInfoDark]];
        SJOStaticCell *cell5 = [SJOStaticCell cellWithTitle:@"Text Cell" andControl:[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 44)]];


        SJOStaticSection *section = [[SJOStaticSection alloc] initWithSectionName:@"Example Section 1" andCells:@[cell1, cell2, cell3, cell4, cell5]];
        
        SJOStaticCell *doneCell = [SJOStaticCell cellWithTitle:@"Done" andActionBlock:^id(SJOStaticCell *cell, UIViewController *controller) {
            
            for (SJOStaticCell* cell in section.cells) {
                if ([cell.control isKindOfClass:[UISwitch class]]) {
                    NSLog(@"%@, %@", cell.title, [((UISwitch*)cell.control) isOn] ? @"YES" : @"NO");
                } else if ([cell.control isKindOfClass:[UITextField class]]) {
                    NSLog(@"%@, %@", cell.title, [((UITextField*)cell.control) text]);

                } else if (cell.result) {
                    NSLog(@"%@, %@", cell.title, cell.result);
                }
            }
            
            return nil;
        }];

        SJOStaticSection *section2 = [[SJOStaticSection alloc] initWithSectionName:@"Example Section 2" andCells:@[doneCell]];

        
        _staticTableViewDataSource = [[SJOStaticTableViewDataSource alloc] initWithSections:@[section, section2]];
        self.tableView.dataSource = _staticTableViewDataSource;
        self.tableView.delegate = _staticTableViewDataSource;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
