//
//  SJOStaticCell.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOStaticCell.h"

@implementation SJOStaticCell

- (id)initWithTitle:(NSString*)title hint:(NSString*)hint accessoryView:(UIView*)accessoryView block:(SJOCellAction)block
{
    self = [super init];
    if (self) {
        _title = title;
        _accessoryView = accessoryView;
        _action = block;
    }
    return self;
}

+(instancetype)cellWithTitle:(NSString *)title andAccessory:(UIView *)accessoryView
{
    SJOStaticCell* cell = [[SJOStaticCell alloc] initWithTitle:title hint:nil accessoryView:accessoryView block:nil];
    return cell;
}

+(instancetype)cellWithTitle:(NSString *)title andActionBlock:(SJOCellAction)block
{
    SJOStaticCell* cell = [[SJOStaticCell alloc] initWithTitle:title hint:nil accessoryView:nil block:block];
    return cell;
}


@end
