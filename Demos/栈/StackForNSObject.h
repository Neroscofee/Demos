//
//  StackForNSObject.h
//  Demos
//
//  Created by Neroscofee on 2017/4/25.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>
//参数是一个id类型的Block
typedef void (^StackBlock)(id objc);
@interface StackForNSObject : NSObject

/**
 入栈
 */
- (void)push:(id)object;

/**
 出栈
 */
- (id)popTopElement;

/**
 返回栈顶元素
 */
- (id)TopElement;

/**
 是否为空
 */
- (BOOL)isEmpty;

/**
 栈的长度
 */
- (NSInteger)stackLength;

/**
 遍历,从栈底开始遍历
 */
- (void)traversalElementFromBottom:(StackBlock)block;

/**
 从顶部开始遍历
 */
- (void)traversalElementFromTop:(StackBlock)block;

/**
 所有元素出栈,一边出栈一边返回元素
 */
- (void)traversalElementPopStack:(StackBlock)block;

/**
 清空
 */
- (void)removeAllObjects;

///**
// 返回栈顶元素
// */
//- (void)topElement;

@end
