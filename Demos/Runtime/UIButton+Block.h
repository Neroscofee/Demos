//
//  UIButton+Block.h
//  Demos
//
//  Created by Neroscofee on 2017/3/3.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^buttonBlock) ();
@interface UIButton (Block)

- (void)handleWithBlock:(buttonBlock)block;

@end
