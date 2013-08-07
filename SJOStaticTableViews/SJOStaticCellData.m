//
//  SJOStaticCell.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOStaticCellData.h"


@implementation SJOStaticCellData

- (id)initWithTitle:(NSString*)title hint:(NSString*)hint accessoryView:(UIView*)accessoryView style:(SJOCellStyle)style accessoryType:(UITableViewCellAccessoryType)accessoryType block:(SJOCellAction)block
{
    self = [super init];
    if (self) {
        _title = title;
        _accessoryView = accessoryView;
        _accessoryType = accessoryType;
        _action = block;
        _style = style;
    }
    return self;
}

+(instancetype)cellWithTitle:(NSString *)title andAccessory:(UIView *)accessoryView
{
    SJOStaticCellData* cell = [[SJOStaticCellData alloc] initWithTitle:title hint:nil accessoryView:accessoryView style:SJOCellStyleDefault accessoryType:UITableViewCellAccessoryNone block:nil];
    return cell;
}

+(instancetype) cellWithTitle:(NSString*)title andActionBlock:(SJOCellAction)block withStyle:(SJOCellStyle)style andAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
    SJOStaticCellData* cell = [[SJOStaticCellData alloc] initWithTitle:title hint:nil accessoryView:nil style:style accessoryType:accessoryType block:block];
    return cell;
}

@end
