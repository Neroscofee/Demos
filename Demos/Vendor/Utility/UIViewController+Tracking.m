//
//  UIViewController+Tracking.m
//  Demos
//
//  Created by Neroscofee on 2017/2/21.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>

@implementation UIViewController (Tracking)

/*
 
 SEL selector 的简写,俗称方法选择器,实质存储的是方法的名称
 IMP implement 的简写,俗称方法实现,看源码得知它就是一个函数指针
 Method 对上述两者的一个包装结构.
 
*/

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        swizzMethod(class, @selector(viewWillAppear:), @selector(plusV_viewWillAppear:));
        swizzMethod(class, @selector(viewDidAppear:), @selector(plusV_viewDidAppear:));
    });
}
//Method里包含方法选择器SEL(实质存储的是一个方法的名称)和方法实现IMP(isa的指针)
static void swizzMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    //class_getInstanceMethod 获取类中的某个实例方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    //class_addMethod 为类添加新的方法,如果方法该方法已存在则返回NO
    //method_getImplementation 获取Method中的IMP(方法实现)
    //method_getTypeEncoding 获取方法的Type字符串(包含参数类型和返回值类型)
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {//返回YES是该类没有添加此方法,如果没有添加,就替换掉已有方法的实现
        //class_replaceMethod 替换类中已有方法的实现,如果该方法不存在则添加该方法
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        //如果存在,就替换Method
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)plusV_viewWillAppear:(BOOL)animated {
    [self plusV_viewWillAppear:animated];
}

- (void)plusV_viewDidAppear:(BOOL)animated {
    [self plusV_viewDidAppear:animated];
    
    BOOL exclude = YES;
    for (NSString *classString in [self excludeArray]) {
        if ([self isKindOfClass:NSClassFromString(classString)]) {
            exclude = NO;
            break;
        }
    }
    if (exclude) {
        NSLog(@"plusV:%@",[self class]);
    }
}

- (NSArray *)excludeArray {
    NSArray *array = @[@"UINavigationController", @"UIPageViewController", @"UIAlertViewController"];
    return array;
}

@end
