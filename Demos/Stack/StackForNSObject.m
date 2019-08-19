//
//  StackForNSObject.m
//  Demos
//
//  Created by Neroscofee on 2017/4/25.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "StackForNSObject.h"

@interface StackForNSObject ()
@property (nonatomic, assign) NSInteger maxSize;
@property (nonatomic, strong) NSMutableArray *stackArray;
@property (nonatomic, assign) NSInteger top;
@property (nonatomic, weak) StackBlock stackBlock;
@end

@implementation StackForNSObject

- (void)push:(id)object {
    [self.stackArray addObject:object];
}

- (id)popTopElement {
    id objc = [self.stackArray lastObject];
    [self.stackArray removeLastObject];
    return objc;
}

- (id)TopElement {
    return [self.stackArray lastObject];
}

- (BOOL)isEmpty {
    return self.stackArray.count;
}

- (NSInteger)stackLength {
    return self.stackArray.count;
}

- (void)traversalElementFromBottom:(StackBlock)block {
    NSEnumerator *objc = [self.stackArray objectEnumerator];
    for (id element in objc) {
        block(element);
    }
}

- (void)traversalElementFromTop:(StackBlock)block {
    NSInteger count = [self.stackArray count];
    for (NSInteger i = count; i > 0; i--) {
        block([self.stackArray objectAtIndex:i-1]);
    }
}

- (void)traversalElementPopStack:(StackBlock)block {
    NSInteger count = self.stackArray.count;
    for (NSInteger i = count; i > 0; i--) {
        block([self.stackArray lastObject]);
        [self.stackArray removeLastObject];
    }
}

- (void)removeAllObjects {
    [self.stackArray removeAllObjects];
}

- (NSMutableArray *)stackArray {
    if (!_stackArray) {
        _stackArray = [NSMutableArray array];
    }
    return _stackArray;
}

- (NSInteger)top {
    _top = self.stackArray.count;
    return _top;
}

- (void)dealloc {
    [self.stackArray removeAllObjects];
}

@end
