//
//  DealerProxy.m
//  Demos
//
//  Created by Neroscofee on 2018/7/10.
//  Copyright © 2018年 Neroscofee. All rights reserved.
//

#import "DealerProxy.h"
#import <objc/runtime.h>

@interface DealerProxy () {
    ToyProvider *_toyProvider;
    PantsProvider *_pantsProvider;
    NSMutableDictionary *_methodsMap;
}

@end

@implementation DealerProxy

+ (instancetype)dealerProxy {
    return [[DealerProxy alloc] init];
}

- (instancetype)init {
    _toyProvider = [[ToyProvider alloc] init];
    _pantsProvider = [[PantsProvider alloc] init];
    _methodsMap = [NSMutableDictionary dictionary];
    [self registerMethodsWithTarget:_toyProvider];
    [self registerMethodsWithTarget:_pantsProvider];
    
    return self;
}

- (void)registerMethodsWithTarget:(id)target {
    unsigned int outCount = 0;
    //获取target方法列表
    Method *methodList = class_copyMethodList([target class], &outCount);
    for (int i=0; i<outCount; i++) {
        Method temp_method = methodList[i];
        //通过方法获取方法选择器
        SEL temp_sel = method_getName(temp_method);
        //通过方法选择器获取方法名
        const char *temp_method_name = sel_getName(temp_sel);
        //将方法名存入字典
        [_methodsMap setObject:target forKey:[NSString stringWithUTF8String:temp_method_name]];
        
    }
    free(methodList);
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    //获取当前选择器
    SEL sel = invocation.selector;
    //通过方法选择器获取方法名
    NSString *methodName = NSStringFromSelector(sel);
    //通过方法名从字典里拿到对应的target
    id target = _methodsMap[methodName];
    if (target && [target respondsToSelector:sel]) {
        [invocation invokeWithTarget:target];
    } else {
        [super forwardInvocation:invocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSString *methodName = NSStringFromSelector(sel);
    id target = _methodsMap[methodName];
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    } else {
        return [super methodSignatureForSelector:sel];
    }
}

@end
