//
//  TriangleView.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/1/4.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "TriangleView.h"
#define W self.bounds.size.width
#define H self.bounds.size.height

@implementation TriangleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, W/2, 0);
    CGContextAddLineToPoint(context, 0, H);
    CGContextAddLineToPoint(context, W, H);
    CGContextAddLineToPoint(context, W/2, 0);
//    CGContextFillPath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextDrawPath(context, kCGPathEOFillStroke);
    CGContextRestoreGState(context);
    
}


@end
