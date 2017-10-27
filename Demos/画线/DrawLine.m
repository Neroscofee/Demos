//
//  DrawLine.m
//  Demos
//
//  Created by Neroscofee on 2017/2/24.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "DrawLine.h"
#import "UIColor+RandomColor.h"

@interface DrawLine ()
@property (nonatomic, strong) NSMutableArray *lines;
@property (nonatomic, strong) NSMutableArray *otherLines;
@end

@implementation DrawLine

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lines = [[NSMutableArray alloc] init];
        self.otherLines = [[NSMutableArray alloc] init];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    for (NSMutableArray *array in self.otherLines) {
        [self drawLineWithData:array];
    }
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
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    NSValue *value = [NSValue valueWithCGPoint:p];
    [self.lines addObject:value];
    [self.otherLines addObject:self.lines];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.lines removeAllObjects];
}

@end
