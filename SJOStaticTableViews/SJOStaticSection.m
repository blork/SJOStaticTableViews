//
//  SJOStaticSection.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOStaticSection.h"

@implementation SJOStaticSection

-(instancetype)initWithSectionName:(NSString*)name andCells:(NSArray*)cells
{
    self = [super init];
    if (self) {
        _name = name;
        _cells = cells;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        _cells = [NSArray array];
    }
    return self;
}

#pragma mark - Subscripting

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return _cells[idx];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    NSMutableArray* mutableCopy = [_cells mutableCopy];
    [mutableCopy setObject:obj atIndexedSubscript:idx];
    _cells = [NSArray arrayWithArray:mutableCopy];
}

#pragma mark - Fast enumeration 

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)len
{
    return [self.cells countByEnumeratingWithState:state objects:buffer count:len];
}

@end
