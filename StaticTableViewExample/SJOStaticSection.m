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

@end
