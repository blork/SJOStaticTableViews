//
//  SJOStaticCell.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOStaticCellData.h"


@implementation SJOStaticCellData

- (id)initWithTitle:(NSString*)title hint:(NSString*)hint accessory:(UIControl*)accessory style:(SJOCellStyle)style accessoryType:(UITableViewCellAccessoryType)accessoryType block:(SJOCellAction)block
{
    self = [super init];
    if (self) {
        _title = title;
        _accessory = accessory;
        _accessoryType = accessoryType;
        _action = block;
        _style = style;
    }
    return self;
}

+(instancetype)cellWithTitle:(NSString *)title andAccessory:(UIControl *)accessoryView
{
    SJOStaticCellData* cell = [[SJOStaticCellData alloc] initWithTitle:title hint:nil accessory:accessoryView style:SJOCellStyleDefault accessoryType:UITableViewCellAccessoryNone block:nil];
    return cell;
}

+(instancetype) cellWithTitle:(NSString*)title andActionBlock:(SJOCellAction)block withStyle:(SJOCellStyle)style andAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
    SJOStaticCellData* cell = [[SJOStaticCellData alloc] initWithTitle:title hint:nil accessory:nil style:style accessoryType:accessoryType block:block];
    return cell;
}

@end
