//
//  SJOStaticCell.h
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SJOStaticCell;

typedef id (^SJOCellAction) (SJOStaticCell* cell, UIViewController* controller);


@interface SJOStaticCell : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *hint;
@property (nonatomic, strong, readonly) UIView *accessoryView;
@property (nonatomic, copy, readonly) SJOCellAction action;
@property (nonatomic, strong) id result;

+(instancetype) cellWithTitle:(NSString*)title andAccessory:(UIView *)accessoryView;
+(instancetype) cellWithTitle:(NSString*)title andActionBlock:(SJOCellAction)block;

@end
