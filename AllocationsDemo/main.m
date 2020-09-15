//
//  main.m
//  AllocationsDemo
//
//  Created by hello on 2020/9/15.
//  Copyright © 2020 TK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([TKAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
