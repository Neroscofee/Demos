//
//  UIBarButtonItem+NSBarButtonItem.m
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import "UIBarButtonItem+NSBarButtonItem.h"
#import "UIButton+NSButton.h"
#import <objc/runtime.h>

static NSString *NSBarButtonItemKey = @"NSBarButtonItemKey";

@implementation UIBarButtonItem (NSBarButtonItem)

+ (UIButton *)imageButtonWithNamed:(nullable NSString *)name size:(CGSize)size target:(nullable id)target action:(nullable SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, size.width, size.height);
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)backButtonWithTarget:(nullable id)target action:(nullable SEL)action {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.bounds = CGRectMake(0, 0, 24, 24);
    [backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return backButton;
}

+ (UIButton *)titleButtonWithName:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action {
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setTitleColor:UIColorMake(0x4D4D4D) forState:UIControlStateNormal];
    [titleButton setTitleColor:UIColorMake(0x4D4D4D) forState:UIControlStateHighlighted];
    titleButton.titleLabel.font = UIFontMake(15);
    [titleButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [titleButton sizeToFit];
    return titleButton;
}

//类方法开始
+ (nullable UIBarButtonItem *)itemWithImageNamed:(NSString *)name size:(CGSize)size target:(id)target action:(SEL)action {
    UIButton *button = [UIBarButtonItem imageButtonWithNamed:name size:size target:target action:action];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barButtonItem;
}

+ (nullable UIBarButtonItem *)itemWithImageNamed:(NSString *)name size:(CGSize)size actionBlock:(ActionBlock)actionBlock {
    UIButton *button = [UIBarButtonItem imageButtonWithNamed:name size:size target:self action:@selector(barButtonItemAction:)];
    objc_setAssociatedObject(button, &NSBarButtonItemKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barButtonItem;
}

+ (nullable UIBarButtonItem *)itemWithBackButtonTarget:(id)target action:(SEL)action {
    UIButton *backButton = [UIBarButtonItem backButtonWithTarget:target action:action];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backBarButtonItem;
}

+ (nullable UIBarButtonItem *)itemWithBackButtonActionBlock:(ActionBlock)actionBlock {
    UIButton *backButton = [UIBarButtonItem backButtonWithTarget:self action:@selector(barButtonItemAction:)];
    objc_setAssociatedObject(backButton, &NSBarButtonItemKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backBarButtonItem;
}

+ (nullable UIBarButtonItem *)itemWithTitle:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action {
    UIButton *titleButton = [UIBarButtonItem titleButtonWithName:title target:target action:action];
    UIBarButtonItem *titleBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleButton];
    return titleBarButtonItem;
}

+ (nullable UIBarButtonItem *)itemWithTitle:(NSString *)title actionBlock:(nullable ActionBlock)actionBlock {
    UIButton *titleButton = [UIBarButtonItem titleButtonWithName:title target:self action:@selector(barButtonItemAction:)];
    objc_setAssociatedObject(titleButton, &NSBarButtonItemKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem *titleBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleButton];
    return titleBarButtonItem;
}

+ (nullable UIBarButtonItem *)itemWithFixedSpaceWidth:(CGFloat)width {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item.width = width;
    return item;
}

+ (void)barButtonItemAction:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)sender;
        ActionBlock actionBlock = objc_getAssociatedObject(button, &NSBarButtonItemKey);
        if (actionBlock) {
            actionBlock();
        }
    }
}

@end
