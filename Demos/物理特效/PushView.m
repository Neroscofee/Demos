//
//  PushView.m
//  Demos
//
//  Created by Neroscofee on 2017/10/25.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "PushView.h"

@interface PushView()
@property (nonatomic, strong) UIPushBehavior *push;
@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CGPoint movePoint;
@property (nonatomic, strong) UIImageView *finger;
@end

@implementation PushView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
        self.push = [[UIPushBehavior alloc] initWithItems:@[self.box] mode:UIPushBehaviorModeInstantaneous];
        [self.animator addBehavior:self.push];
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.box]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:collision];
        self.finger = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        self.finger.hidden = YES;
        [self addSubview:self.finger];
        self.finger.tintColor = [UIColor redColor];
        [self.finger setNeedsDisplay];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)panGesture {
    CGPoint point = [panGesture locationInView:self];
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        self.beginPoint = point;
        self.finger.hidden = NO;
        self.finger.center = self.beginPoint;
    } else if (panGesture.state == UIGestureRecognizerStateChanged) {
        self.movePoint = point;
        [self setNeedsDisplay];//开始移动时请求重绘视图
    } else if (panGesture.state == UIGestureRecognizerStateEnded) {
        self.endPoint = point;
        CGPoint offset = CGPointMake(self.beginPoint.x - self.endPoint.x, self.beginPoint.y - self.endPoint.y);
        self.push.active = YES;
        self.push.angle = atan2f(offset.y, offset.x);
        self.push.magnitude = sqrtf(offset.x*offset.x + offset.y*offset.y)/500;
        [self clearLines];
        self.finger.hidden = YES;
    }
    
}

- (void)clearLines {
    self.beginPoint = CGPointZero;
    self.endPoint = CGPointZero;
    self.movePoint = CGPointZero;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, self.beginPoint.x, self.beginPoint.y);
    CGContextAddLineToPoint(context, self.movePoint.x, self.movePoint.y);
    CGContextSetLineWidth(context, 5.0f);
    CGFloat length[] = {15.0,5.0};
    CGContextSetLineDash(context, 0, length, 2);
    [[UIColor blueColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    CGContextRestoreGState(context);
}

@end
