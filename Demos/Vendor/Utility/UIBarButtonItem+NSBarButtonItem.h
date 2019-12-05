//
//  UIBarButtonItem+NSBarButtonItem.h
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (NSBarButtonItem)

/**
 创建带图片的BarButtonItem
 
 @param name 图片名
 @param size 图片大小
 @param target target description
 @param action 点击事件
 @return 带图片的BarButtonItem
 */
+ (nullable UIBarButtonItem *)itemWithImageNamed:(nullable NSString *)name size:(CGSize)size target:(nullable id)target action:(nullable SEL)action;

/**
 用block方式创建带图片的BarButtonItem
 
 @param name 图片名
 @param size 图片大小
 @param actionBlock 点击事件
 @return 带图片的BarButtonItem
 */
+ (nullable UIBarButtonItem *)itemWithImageNamed:(NSString *)name size:(CGSize)size actionBlock:(nullable ActionBlock)actionBlock;

/**
 *  创建返回按钮
 *
 *  @param target target description
 *  @param action 返回事件
 *
 *  @return 返回按钮
 */
+ (nullable UIBarButtonItem *)itemWithBackButtonTarget:(nullable id)target action:(nullable SEL)action;

/**
 *  用block方式创建返回按钮
 *
 *  @param actionBlock 返回事件
 *
 *  @return 返回按钮
 */
+ (nullable UIBarButtonItem *)itemWithBackButtonActionBlock:(nullable ActionBlock)actionBlock;

/**
 *  创建文字按钮
 *
 *  @param title  文字
 *  @param target target description
 *  @param action 点击事件
 *
 *  @return 文字按钮
 */
+ (nullable UIBarButtonItem *)itemWithTitle:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action;

/**
 *  用block方式创建文字按钮
 *
 *  @param title       文字
 *  @param actionBlock 点击事件
 *
 *  @return 文字按钮
 */
+ (nullable UIBarButtonItem *)itemWithTitle:(nullable NSString *)title actionBlock:(nullable ActionBlock)actionBlock;

+ (nullable UIBarButtonItem *)itemWithFixedSpaceWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
