//
//  DrawLine.m
//  Demos
//
//  Created by Neroscofee on 2017/2/24.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "DrawLine.h"
#import "UIColor+RandomColor.h"

//@interface DrawLine ()
//@property (nonatomic, strong) NSMutableArray *lines;
//@property (nonatomic, strong) NSMutableArray *otherLines;
//@end

@implementation DrawLine

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lines = [[NSMutableArray alloc] init];
        self.lineWidth = 1.0;
        self.lineAlpha = 1.0;
        self.colorValue = 1;
//        self.otherLines = [[NSMutableArray alloc] init];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    for (NSMutableArray *array in self.otherLines) {
//        [self drawLineWithData:array];
//    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (NSMutableArray *line in self.lines) {
        for (int i = 0; i < line.count; i++) {
            CGPoint p = [line[i] CGPointValue];
            if (i == 0) {
                CGContextMoveToPoint(context, p.x, p.y);
            } else {
                CGContextAddLineToPoint(context, p.x, p.y);
            }
        }
    }
    
    if (self.lineWidth != 1) {
        CGContextSetLineWidth(context, self.lineWidth);
    } else {
        CGContextSetLineWidth(context, 1);
    }
    if (self.lineAlpha != 1) {
        CGContextSetAlpha(context, self.lineAlpha);
    } else {
        CGContextSetAlpha(context, 1);
    }
    if (self.colorValue == 1) {
        [[UIColor redColor] setStroke];
    } else {
        [[UIColor blueColor] setStroke];
    }
    
    CGContextDrawPath(context, kCGPathStroke);
    
}

- (void)drawLineWithData:(NSMutableArray *)linesArray {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    UIBezierPath *path = [UIBezierPath bezierPath];
    NSValue *value = [linesArray firstObject];
    [path moveToPoint:[value CGPointValue]];
    for (NSValue *values in linesArray) {
        [path addLineToPoint:[values CGPointValue]];
    }
    path.lineWidth = 2;
    [[UIColor redColor] setStroke];
    [path stroke];

    
    CGContextRestoreGState(context);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    self.line = [NSMutableArray array];
    [self.lines addObject:self.line];
    [self.line addObject:[NSValue valueWithCGPoint:p]];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint p = [touch locationInView:self];
//    NSValue *value = [NSValue valueWithCGPoint:p];
//    [self.lines addObject:value];
//    [self.otherLines addObject:self.lines];
//    [self setNeedsDisplay];
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    [self.line addObject:[NSValue valueWithCGPoint:p]];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.lines removeAllObjects];
}

@end
