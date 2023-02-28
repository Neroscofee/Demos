//
//  UIDevice+NSHeight.h
//  Demos
//
//  Created by Neroscofee on 2023/2/6.
//  Copyright © 2023 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (NSHeight)

/// 顶部安全高度
+ (CGFloat)getSafeTop;

/// 底部安全高度
+ (CGFloat)getSafeBottom;

/// 顶部状态栏高度
+ (CGFloat)getStatusBar;

/// 导航栏高度
+ (CGFloat)getNavigationBar;

/// 状态栏+导航栏高度
+ (CGFloat)getTopFullBar;

/// 底部分栏高度
+ (CGFloat)getTabBar;

/// 底部分栏+底部安全高度
+ (CGFloat)getBottomFullBar;

/// 内容高度
+ (CGFloat)getContent;

@end

NS_ASSUME_NONNULL_END
