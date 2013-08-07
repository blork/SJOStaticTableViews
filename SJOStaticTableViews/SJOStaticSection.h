//
//  SJOStaticSection.h
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOStaticSection : NSObject<NSFastEnumeration>

@property (nonatomic, copy, readonly) NSString* name;
@property (nonatomic, strong, readonly) NSArray* cells;

-(id)initWithSectionName:(NSString*)name andCells:(NSArray*)cells;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;

@end
