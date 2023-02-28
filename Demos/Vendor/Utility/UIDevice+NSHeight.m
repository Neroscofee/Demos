//
//  UIDevice+NSHeight.m
//  Demos
//
//  Created by Neroscofee on 2023/2/6.
//  Copyright © 2023 Neroscofee. All rights reserved.
//

#import "UIDevice+NSHeight.h"

@implementation UIDevice (NSHeight)

+ (CGFloat)getSafeTop {
    if (@available(iOS 13.0, *)) {
        NSSet *set = [UIApplication sharedApplication].connectedScenes;
        UIWindowScene *windowScene = [set anyObject];
        UIWindow *window = windowScene.windows.firstObject;
        return window.safeAreaInsets.top;
    } else if (@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
        return window.safeAreaInsets.top;
    }
    return 0;
}

+ (CGFloat)getSafeBottom {
    if (@available(iOS 13.0, *)) {
        NSSet *set = [UIApplication sharedApplication].connectedScenes;
        UIWindowScene *windowScene = [set anyObject];
        UIView *window = windowScene.windows.firstObject;
        return window.safeAreaInsets.bottom;
    } else if (@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
        return window.safeAreaInsets.top;
    }
    return 0;
}

+ (CGFloat)getStatusBar {
    if (@available(iOS 13.0, *)) {
        NSSet *set = [UIApplication sharedApplication].connectedScenes;
        UIWindowScene *windowScene = [set anyObject];
        UIStatusBarManager *statusBarManager = windowScene.statusBarManager;
        return statusBarManager.statusBarFrame.size.height;
    } else {
        return [UIApplication sharedApplication].statusBarFrame.size.height;
    }
}

+ (CGFloat)getNavigationBar {
    return 44.0f;
}

+ (CGFloat)getTopFullBar {
    return [UIDevice getStatusBar] + [UIDevice getNavigationBar];
}

+ (CGFloat)getTabBar {
    return 49.0f;
}

+ (CGFloat)getBottomFullBar {
    return [UIDevice getTabBar] + [UIDevice getSafeBottom];
}

+ (CGFloat)getContent {
    return SCREEN_HEIGHT - [UIDevice getTopFullBar] - [UIDevice getSafeBottom];
}

@end
