//
//  SNButton.h
//  Demos
//
//  Created by Neroscofee on 2020/10/27.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonLayoutType) {
    ButtonLayoutTypeHorizon = 0,    // 水平布局，左边image，右边text
    ButtonLayoutTypeVertical,       // 垂直布局，上边image，下边text
    ButtonLayoutTypeVerticalSmall,
};

NS_ASSUME_NONNULL_BEGIN

@interface SNButton : UIButton

@property (nonatomic, assign) ButtonLayoutType layoutType;

/// image距离按钮内边距的距离
@property (nonatomic, assign) CGFloat gap;

/// 按钮内图片与文字的距离
@property (nonatomic, assign) CGFloat imageAndTitleInset;
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) CGSize titleSize;

@end

NS_ASSUME_NONNULL_END
