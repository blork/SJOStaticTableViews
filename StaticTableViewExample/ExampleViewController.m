//
//  ExampleViewController.m
//  StaticTableViewExample
//
//  Created by Sam Oakley on 04/08/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "ExampleViewController.h"
#import "SJOStaticCellData.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:[UIColor yellowColor]];
        
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Set a result for the previous view controller
    [self.resultCell setResult:@42];
}

@end
