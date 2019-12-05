//
//  UIButton+NSButton.h
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (NSButton)

/**
 扩大按钮点击区域
 
 @param enlargeEdgeInsets 内边距,扩大点击区域时均传负值
 */
- (void)setEnlargeEdgeInsets:(UIEdgeInsets)enlargeEdgeInsets;


/**
 交换按钮图片和标题位置(外加间隔)
 
 @param state state
 @param space 间隔
 */
- (void)judgeButtonTitleAndImage:(UIControlState)state space:(CGFloat)space;


+ (UIButton *)gradientButtonFrame:(CGRect)frame title:(NSString *)title;

+ (UIButton *)commonButtonFrame:(CGRect)frame title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
