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
#import "SJOStaticCellData.h"
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
        _staticTableViewDataSource = [[SJOStaticTableViewDataSource alloc] init];
        self.tableView.dataSource = _staticTableViewDataSource;
        self.tableView.delegate = _staticTableViewDataSource;
        
        _staticTableViewDataSource.customiseBlock = ^(SJOStaticCellData* staticCellData, UITableViewCell *cell, NSIndexPath* indexPath){
            cell.backgroundColor = indexPath.row % 2 == 0 ? [UIColor colorWithWhite:0.9 alpha:1] : [UIColor colorWithWhite:0.95 alpha:1];
            if (staticCellData.style == SJOCellStyleButton) {
                cell.backgroundColor = [UIColor colorWithRed:0.592 green:0.902 blue:0.482 alpha:1.0];
            }
        };
        
        [self setupStaticData];
    }
    return self;
}

-(void) setupStaticData
{
    __weak ExampleTableViewController* weakSelf = self;
    
    SJOStaticSection* section1 = self.staticTableViewDataSource[@"section1"];
    
    section1[0] = [SJOStaticCellData cellWithTitle:@"Switch Cell" andAccessory:[[UISwitch alloc] init]];
    section1[1] = [SJOStaticCellData cellWithTitle:@"Block Cell" andActionBlock:^id(SJOStaticCellData *cell) {
        ExampleViewController* vc = [[ExampleViewController alloc] init];
        vc.resultCell = cell;
        [weakSelf.navigationController pushViewController:vc animated:YES];
        return nil;
    } withStyle:SJOCellStyleDefault andAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    section1[2] = [SJOStaticCellData cellWithTitle:@"Slider Cell" andAccessory:[[UISlider alloc] init]];
    section1[3] = [SJOStaticCellData cellWithTitle:@"Button Cell" andAccessory:[UIButton buttonWithType:UIButtonTypeInfoDark]];
    
    
    UITextField *textField = [[UITextField alloc] init];
    [textField setDelegate:self];
    [textField setPlaceholder:@"Placeholder"];
    [textField setReturnKeyType:UIReturnKeyNext];
    section1[4] = [SJOStaticCellData cellWithTitle:@"Text Cell" andAccessory:textField];
    
    
    UITextField *textField2 = [[UITextField alloc] init];
    [textField2 setDelegate:self];
    [textField2 setPlaceholder:@"Another Placeholder"];
    
    section1[5] = [SJOStaticCellData cellWithTitle:@"Text Cell" andAccessory:textField2];
    
    self.staticTableViewDataSource[@""][0] = [SJOStaticCellData cellWithTitle:@"Done" andActionBlock:^id(SJOStaticCellData *cell) {
        
        for (SJOStaticCellData* cell in section1)
        {
            if ([cell.accessoryView isKindOfClass:[UISwitch class]])
            {
                NSLog(@"%@, %@", cell.title, [((UISwitch*)cell.accessoryView) isOn] ? @"YES" : @"NO");
            }
            else if ([cell.accessoryView isKindOfClass:[UISlider class]])
            {
                NSLog(@"%@, %f", cell.title, [((UISlider*)cell.accessoryView) value]);
            }
            else if ([cell.accessoryView isKindOfClass:[UITextField class]])
            {
                NSLog(@"%@, %@", cell.title, [((UITextField*)cell.accessoryView) text]);
            }
            else if (cell.result)
            {
                NSLog(@"%@, %@", cell.title, cell.result);
            }
        }
        
        return nil;
    } withStyle:SJOCellStyleButton andAccessoryType:UITableViewCellAccessoryNone];
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
        for (SJOStaticCellData* cell in section.cells) {
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
