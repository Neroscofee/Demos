//
//  NSFrameworkManager.m
//  Demos
//
//  Created by Neroscofee on 2019/12/8.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import "NSFrameworkManager.h"

@implementation NSFrameworkManager

+ (NSFrameworkManager *)sharedInstance {
    static NSFrameworkManager *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[NSFrameworkManager alloc] init];
    });
    return _sharedInstance;
}

- (void)toWelcomeFramework {
    if (self.welcomeFrameworkHandle) {
        self.welcomeFrameworkHandle();
    }
}

- (void)toMainFramework {
    if (self.mainFrameworkHandle) {
        self.mainFrameworkHandle();
    }
}

@end
