//
//  SNUtility.h
//  Demos
//
//  Created by Neroscofee on 2020/10/28.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNUtility : NSObject

+ (UIView *)createSeparateLine:(CGRect)frame color:(UIColor *)color;

+ (void)rightSlideBackWithTarget:(id)target;

/**
 创建label
 有字体颜色
 */
+ (UILabel *)createLabelWithFrame:(CGRect)rect text:(NSString *)text font:(NSInteger)fontSize bold:(BOOL)isBold textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
