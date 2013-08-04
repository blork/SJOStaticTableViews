//
//  SJOStaticTableViewDataSource.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOStaticTableViewDataSource.h"
#import "SJOStaticSection.h"
#import "SJOStaticCell.h"

@implementation SJOStaticTableViewDataSource

- (id)initWithSections:(NSArray*) sections
{
    self = [super init];
    if (self) {
        _sections = sections;
    }
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[_sections objectAtIndex:section] cells] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[[self class] cellIdentifier]];
    
    SJOStaticCell* staticCell = [[[_sections objectAtIndex:indexPath.section] cells] objectAtIndex:indexPath.row];
    

    [cell.textLabel setText:staticCell.title];
    
    if (staticCell.control) {
        cell.accessoryView = staticCell.control;
    } else if (staticCell.action) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[_sections objectAtIndex:section] name];
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return @"Footer";
//}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJOStaticCell* staticCell = [[[_sections objectAtIndex:indexPath.section] cells] objectAtIndex:indexPath.row];
    if (staticCell.control) {
        [staticCell.control sendActionsForControlEvents:UIControlEventTouchUpInside];
    } else if (staticCell.action) {
        staticCell.result = staticCell.action(staticCell, nil);
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{

}

+ (NSString*) cellIdentifier
{
    return @"SJOStaticTableViewDataSourceCell";
}


@end
