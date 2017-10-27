//
//  EmitterView.m
//  Demos
//
//  Created by Neroscofee on 2017/9/5.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "EmitterView.h"

@implementation EmitterView
{
    CAEmitterLayer *fireEmitter;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        fireEmitter = [[CAEmitterLayer alloc] init];
        fireEmitter.renderMode = kCAEmitterLayerAdditive;
        fireEmitter.emitterShape = kCAEmitterLayerLine;
        CAEmitterCell *fire = [CAEmitterCell emitterCell];
        fire.birthRate = 5;
        fire.lifetime = 1.0;
        fire.lifetimeRange = 0;
        fire.color = [UIColor randomColor].CGColor;
        fire.contents = (id)[UIImage imageNamed:@"snow1.png"].CGImage;
        fire.velocity = 30;
        fire.velocityRange = 1;
        fire.scaleSpeed = 0.3;
        fire.emissionRange = 2;
        fire.spin = 10;
        [fire setName:@"fire"];
        fireEmitter.emitterCells = [NSArray arrayWithObject:fire];
        [self.layer addSublayer:fireEmitter];
    }
    return self;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
