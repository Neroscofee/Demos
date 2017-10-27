//
//  UIButton+Action.m
//  Demos
//
//  Created by Neroscofee on 2017/3/3.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "UIButton+Action.h"
#import <objc/runtime.h>

@implementation UIButton (Action)
@dynamic actionBlock;
static char remarkKey;

- (void)setActionBlock:(ActionBlock)actionBlock {
    objc_setAssociatedObject(self, &remarkKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionBlock)actionBlock {
    return objc_getAssociatedObject(self, &remarkKey);
}

+ (UIButton *)initWithFrame:(CGRect)frame title:(NSString *)title fontSize:(NSInteger)fontSize actionBlock:(ActionBlock)block {
    UIButton *button = [[UIButton alloc] init];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.actionBlock = block;
    [button addTarget:button action:@selector(methodForButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;//
}

- (void)methodForButton:(UIButton *)button {
    if (self.actionBlock) {
        self.actionBlock(button);
    }
}

@end
