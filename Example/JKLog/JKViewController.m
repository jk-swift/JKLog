//
//  JKViewController.m
//  JKLog
//
//  Created by yulongmailbox@163.com on 03/27/2021.
//  Copyright (c) 2021 yulongmailbox@163.com. All rights reserved.
//

#import "JKViewController.h"
#import <JKLog/JKLog.h>
#import <JKLog/aloggerbase.h>

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self _setupLog];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///

- (void)_setupLog
{
    JKLogOptions *opts = [[JKLogOptions alloc] init];
    opts.level = JKLogLevelDebug;
    opts.filePrefix = @"log";
    opts.moduleName = @"demo";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    opts.path = [paths.firstObject stringByAppendingPathComponent:@"/log"];

    [[JKLog shared] setupWithOptions:opts];

    JKLogInfo(@"special logger...");
}

@end
