//
//  SJOStaticSection.h
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOStaticSection : NSObject

@property (nonatomic, copy, readonly) NSString* name;
@property (nonatomic, strong, readonly) NSArray* cells;

-(id)initWithSectionName:(NSString*)name andCells:(NSArray*)cells;
@end
