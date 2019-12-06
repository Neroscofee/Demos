//
//  FireButton.m
//  Demos
//
//  Created by Neroscofee on 2017/9/5.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "FireButton.h"
#import "EmitterView.h"

@implementation FireButton
{
    EmitterView *emitterView;
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        emitterView = [[EmitterView alloc] init];
        [self addSubview:emitterView];
        [self setNeedsDisplay];
        [self setImage:UIImageMake(@"fire_start.png") forState:UIControlStateNormal];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, self.bounds);
    keyAnimation.path = path;
    keyAnimation.duration = 7;
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    [emitterView.layer addAnimation:keyAnimation forKey:@"position"];
}


@end
