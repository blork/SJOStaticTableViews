//
//  SJOStaticCell.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOStaticCell.h"

@implementation SJOStaticCell

- (id)initWithTitle:(NSString*)title control:(UIControl*)control block:(SJOCellAction)block
{
    self = [super init];
    if (self) {
        _title = title;
        _control = control;
        _action = block;
    }
    return self;
}

+(instancetype)cellWithTitle:(NSString *)title andControl:(UIControl *)control
{
    SJOStaticCell* cell = [[SJOStaticCell alloc] initWithTitle:title control:control block:nil];
    return cell;
}

+(instancetype)cellWithTitle:(NSString *)title andActionBlock:(SJOCellAction)block
{
    SJOStaticCell* cell = [[SJOStaticCell alloc] initWithTitle:title control:nil block:block];
    return cell;
}


@end
