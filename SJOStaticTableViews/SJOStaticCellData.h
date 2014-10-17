//
//  SJOStaticCell.h
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class SJOStaticCellData;

typedef id (^SJOCellAction) (SJOStaticCellData* cell);
typedef NS_ENUM(NSInteger, SJOCellStyle) {
    SJOCellStyleDefault,
    SJOCellStyleButton
};

@interface SJOStaticCellData : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong, readonly) UIControl *accessory;
@property (nonatomic, assign, readonly) UITableViewCellAccessoryType accessoryType;
@property (nonatomic, assign, readonly) SJOCellStyle style;
@property (nonatomic, copy, readonly) SJOCellAction action;
@property (nonatomic, strong) id result;

+(instancetype) cellWithTitle:(NSString*)title andAccessory:(UIControl *)accessoryView;
+(instancetype) cellWithTitle:(NSString*)title andActionBlock:(SJOCellAction)block withStyle:(SJOCellStyle)style andAccessoryType:(UITableViewCellAccessoryType)accessoryType;

@end
