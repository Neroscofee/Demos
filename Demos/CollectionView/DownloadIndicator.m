//
//  DownloadIndicator.m
//  Demos
//
//  Created by Neroscofee on 2017/1/9.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "DownloadIndicator.h"
#import "UIColor+RandomColor.h"

@implementation DownloadIndicator

//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self addSubview:self.textLable];
//    }
//    return self;
//}

- (UIColor *)lineColor {
    if (!_lineColor) {
        _lineColor = [UIColor blackColor];
    }
    return _lineColor;
}

- (CGFloat)lineWidth {
    if (!_lineWidth) {
        _lineWidth = 7;
    }
    return _lineWidth;
}

- (UILabel *)textLable {
    if (!_textLable) {
        CGFloat currentRadius = self.bounds.size.width > self.bounds.size.height ? self.bounds.size.height/2:self.bounds.size.width/2;
        CGFloat sideLength = (currentRadius - self.lineWidth)*2/sqrt(2);
        _textLable = [[UILabel alloc] init];
        _textLable.frame = CGRectMake(0, 0, sideLength, sideLength);
        _textLable.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        _textLable.textAlignment = NSTextAlignmentCenter;
//        _textLable.font = [UIFont systemFontOfSize:40];
        _textLable.adjustsFontSizeToFitWidth = YES;
    }
    return _textLable;
}

- (void)setValue:(CGFloat)value {
    _value = value;
    int a = value*100;
    self.textLable.text = [NSString stringWithFormat:@"%d%%",a];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat currentRadius = rect.size.width > rect.size.height ? rect.size.height/2:rect.size.width/2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:currentRadius-self.lineWidth startAngle:M_PI_2*3 endAngle:M_PI_2*3 + self.value*M_PI*2 clockwise:YES];
    [self.lineColor setStroke];
    path.lineWidth = self.lineWidth;
    [path stroke];
    
    [self addSubview:self.textLable];
}


@end
