//
//  NSNavigationController.h
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNavigationController : UINavigationController<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *panPopGR;

@end

@protocol NSPanGestureEnableDelegate <NSObject>

//是否允许手势返回
- (BOOL)panGestureEnable;

@end

NS_ASSUME_NONNULL_END
