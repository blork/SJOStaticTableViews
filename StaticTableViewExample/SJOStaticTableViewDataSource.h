//
//  SJOStaticTableViewDataSource.h
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOStaticTableViewDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>
@interface SJOStaticTableViewDataSource : NSObject<UITableViewDataSource, UITableViewDelegate, NSFastEnumeration>

@property (nonatomic, strong, readonly) NSArray* sections;
+ (NSString*) cellIdentifier;

- (id)initWithSections:(NSArray*) sections;

- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end
