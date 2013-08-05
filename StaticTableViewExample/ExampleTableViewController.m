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
@property (nonatomic, strong) UIToolbar *keyboardToolbar;
@end

@implementation ExampleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[SJOStaticTableViewDataSource cellIdentifier]];
        
        __weak ExampleTableViewController* weakSelf = self;
        
        SJOStaticCell *cell1 = [SJOStaticCell cellWithTitle:@"Switch Cell" andAccessory:[[UISwitch alloc] init]];
        SJOStaticCell *cell2 = [SJOStaticCell cellWithTitle:@"Block Cell" andActionBlock:^id(SJOStaticCell *cell, UIViewController *controller) {
            [weakSelf.navigationController pushViewController:[[ExampleViewController alloc] init] animated:YES];
            return nil;
        }];
        SJOStaticCell *cell3 = [SJOStaticCell cellWithTitle:@"Slider Cell" andAccessory:[[UISlider alloc] init]];
        SJOStaticCell *cell4 = [SJOStaticCell cellWithTitle:@"Button Cell" andAccessory:[UIButton buttonWithType:UIButtonTypeInfoDark]];
        
        
        
        UITextField *textField = [[UITextField alloc] init];
        [textField setDelegate:self];
        [textField setPlaceholder:@"Placeholder"];
        [textField setReturnKeyType:UIReturnKeyNext];
        SJOStaticCell *cell5 = [SJOStaticCell cellWithTitle:@"Text Cell" andAccessory:textField];
        
        
        UITextField *textField2 = [[UITextField alloc] init];
        [textField2 setDelegate:self];
        [textField2 setPlaceholder:@"Another Placeholder"];
        
        SJOStaticCell *cell6 = [SJOStaticCell cellWithTitle:@"Text Cell" andAccessory:textField2];
        
        
        SJOStaticSection *section = [[SJOStaticSection alloc] initWithSectionName:@"Example Section 1" andCells:@[cell1, cell2, cell3, cell4, cell5, cell6]];
        
        SJOStaticCell *doneCell = [SJOStaticCell cellWithTitle:@"Done" andActionBlock:^id(SJOStaticCell *cell, UIViewController *controller) {
            
            for (SJOStaticCell* cell in section.cells) {
                if ([cell.accessoryView isKindOfClass:[UISwitch class]]) {
                    NSLog(@"%@, %@", cell.title, [((UISwitch*)cell.accessoryView) isOn] ? @"YES" : @"NO");
                } else if ([cell.accessoryView isKindOfClass:[UITextField class]]) {
                    NSLog(@"%@, %@", cell.title, [((UITextField*)cell.accessoryView) text]);
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

#pragma mark - Text field delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL hasSeen = NO;
    for (SJOStaticSection* section in self.staticTableViewDataSource.sections) {
        for (SJOStaticCell* cell in section.cells) {
            if (cell.accessoryView && [cell.accessoryView isKindOfClass:[UITextField class]]) {
                if ([cell.accessoryView isEqual:textField]) {
                    hasSeen = YES;
                } else if (hasSeen) {
                    [cell.accessoryView becomeFirstResponder];
                    return NO;
                }
            }
        }
    }
    
    
    [textField resignFirstResponder];
    return NO;
}


@end
