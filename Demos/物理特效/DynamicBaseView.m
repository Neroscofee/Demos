//
//  DynamicBaseView.m
//  Demos
//
//  Created by Neroscofee on 2017/10/25.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "DynamicBaseView.h"

@implementation DynamicBaseView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [UIApplication sharedApplication].keyWindow.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        UIImageView *box = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
        box.frame = CGRectMake(0, 0, 40, 40);
        box.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        self.box = box;
        [self addSubview:box];
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    }
    return self;//override
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
