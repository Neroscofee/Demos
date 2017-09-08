//
//  UIButton+Block.h
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/3.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^buttonBlock) ();
@interface UIButton (Block)

- (void)handleWithBlock:(buttonBlock)block;

@end
