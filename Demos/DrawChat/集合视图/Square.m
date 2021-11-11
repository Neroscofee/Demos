//
//  Square.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/1/5.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "Square.h"
#import "UIColor+RandomColor.h"
@implementation Square

- (void)changeColor {
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(arc4random()%320, arc4random()%480)];
//    [path addLineToPoint:CGPointMake(arc4random()%320, arc4random()%480)];
//    [path closePath];
//    [[UIColor orangeColor] setFill];
//    [path stroke];
//    
//    [path fill];
//    
//    path.lineWidth = 2;
//    path.lineJoinStyle = kCGLineJoinMiter;
//    path.lineCapStyle = kCGLineCapButt;
//    
//    CGContextRestoreGState(context);
    
    //矩形
//    UIBezierPath *myRect = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 40, 40)];
//    myRect.lineWidth = 4;
//    [[UIColor purpleColor] setFill];
//    [myRect stroke];
//    [myRect fill];
//    
//    //圆角矩形
//    UIBezierPath *myRoundRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(130, 60, 80, 80) cornerRadius:5];
//    myRoundRect.lineWidth = 7;
//    [[UIColor orangeColor] setFill];
//    [myRoundRect stroke];
//    [myRoundRect fill];
//    
//    //椭圆
//    UIBezierPath *myOval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(220, 40, 100, 70)];
//    [myOval stroke];
    
    //
    UIBezierPath *myArc = [UIBezierPath bezierPathWithArcCenter:CGPointMake(160, 200) radius:50 startAngle:M_PI_2 endAngle:M_PI_4 clockwise:YES];
    [myArc addLineToPoint:CGPointMake(160, 200)];
    [myArc closePath];
    [[UIColor randomColor] setFill];
    [myArc stroke];
    [myArc fill];
    
    //
//    UIBezierPath *myCurve = [UIBezierPath bezierPath];
//    [myCurve moveToPoint:CGPointMake(260, 320)];
//    [myCurve addCurveToPoint:CGPointMake(10, 320) controlPoint1:CGPointMake(120, 350) controlPoint2:CGPointMake(120, 350)];
//    [myCurve stroke];
//    
//    UIBezierPath *mts = [UIBezierPath bezierPath];
//    [mts moveToPoint:CGPointMake(0, 0)];
//    [mts addCurveToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height) controlPoint1:CGPointMake(200, 200) controlPoint2:CGPointMake(200, 200)];
//    [mts stroke];//mts addCurveToPoint
//    
//    UIBezierPath *git = [UIBezierPath bezierPath];
//    [git moveToPoint:CGPointZero];
//    [git addQuadCurveToPoint:CGPointMake(200, 200) controlPoint:CGPointMake(10, 100)];
//    [git stroke];
//    
//    UIBezierPath *svn = [UIBezierPath bezierPath];
//    [svn moveToPoint:CGPointMake(0, 0)];
//    [svn addQuadCurveToPoint:CGPointMake(200, 400) controlPoint:CGPointMake(100, 10)];
//    [svn stroke];
//    //
//    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(160, 400) radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    [circle stroke];
//    
//    UIBezierPath *smallRect = [UIBezierPath bezierPathWithRect:CGRectMake(70, 500, 50, 50)];
//    [[UIColor greenColor] setFill];
//    [[UIColor greenColor] setStroke];
//    [smallRect stroke];
//    [smallRect fill];
    
    
}


@end
