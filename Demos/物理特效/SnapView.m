//
//  SnapView.m
//  Demos
//
//  Created by Neroscofee on 2017/11/22.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "SnapView.h"

@implementation SnapView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.animator removeAllBehaviors];
    CGPoint point = [touches.anyObject locationInView:self];
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.box snapToPoint:point];
    [self.animator addBehavior:snap];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
