//
//  CalButton.m
//  Demos
//
//  Created by Neroscofee on 2020/12/24.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "CalButton.h"

@implementation CalButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        
        [self addSubview:button];
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
