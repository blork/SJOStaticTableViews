//
//  SJOStaticTableViewDataSource.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOStaticTableViewDataSource.h"
#import "SJOStaticSection.h"
#import "SJOStaticCellData.h"

@interface SJOStaticTableViewDataSource ()

@end

@implementation SJOStaticTableViewDataSource

- (id)init
{
    self = [super init];
    if (self) {
        _sections = [NSArray array];
    }
    return self;
}

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
    
    SJOStaticCellData* staticCell = [[[_sections objectAtIndex:indexPath.section] cells] objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:staticCell.title];
    
    
    switch (staticCell.style) {
        case SJOCellStyleButton:
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case SJOCellStyleDefault:
        default:
            break;
    }
    
    if (staticCell.accessoryView) {
        cell.accessoryView = staticCell.accessoryView;
        [cell.accessoryView sizeToFit];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if (staticCell.action) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
    cell.accessoryType = staticCell.accessoryType;
    
    if (self.customiseBlock) {
        self.customiseBlock(staticCell, cell, indexPath);
    }
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[_sections objectAtIndex:section] name];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJOStaticCellData* staticCell = [[[_sections objectAtIndex:indexPath.section] cells] objectAtIndex:indexPath.row];
    if (staticCell.accessoryView) {
        
    } else if (staticCell.action) {
        staticCell.result = staticCell.action(staticCell);
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


+ (NSString*) cellIdentifier
{
    return @"SJOStaticTableViewDataSourceCell";
}

#pragma mark - Subscripting

- (id)objectForKeyedSubscript:(id <NSCopying>)key
{
    SJOStaticSection* section = [[self.sections filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name == %@", key]] lastObject];
    if (!section) {
        self[key] = [NSArray array];
        return self[key];
    } else {
        return section;
    }
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    SJOStaticSection* section = [[SJOStaticSection alloc] initWithSectionName:(NSString*)key andCells:obj];
    _sections = [NSArray arrayWithArray:[[self.sections mutableCopy] arrayByAddingObject:section]];
}

#pragma mark - Fast enumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)len
{
    return [self.sections countByEnumeratingWithState:state objects:buffer count:len];
}


@end
