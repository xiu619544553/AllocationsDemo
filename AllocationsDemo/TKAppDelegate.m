//
//  TKAppDelegate.m
//  AllocationsDemo
//
//  Created by hello on 2020/9/15.
//  Copyright © 2020 TK. All rights reserved.
//

#import "TKAppDelegate.h"
#import "TKEntranceViewController.h"

@interface TKAppDelegate ()

@end

@implementation TKAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[TKEntranceViewController new]];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
