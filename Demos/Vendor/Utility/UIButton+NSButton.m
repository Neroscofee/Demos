//
//  UIButton+NSButton.m
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import "UIButton+NSButton.h"
#import <objc/runtime.h>
#import "UIImage+NSImage.h"

static char edgeInsetsKey;

@implementation UIButton (NSButton)

- (void)setEnlargeEdgeInsets:(UIEdgeInsets)enlargeEdgeInsets {
    objc_setAssociatedObject(self, &edgeInsetsKey, [NSValue valueWithUIEdgeInsets:enlargeEdgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSValue *value = objc_getAssociatedObject(self, &edgeInsetsKey);
    if (value) {
        UIEdgeInsets edge = [value UIEdgeInsetsValue];
        CGRect rect = CGRectMake(edge.left, edge.top, CGRectGetWidth(self.bounds) - edge.left - edge.right, CGRectGetHeight(self.bounds) - edge.top - edge.bottom);
        return CGRectContainsPoint(rect, point) ? YES:NO;
    } else {
        return CGRectContainsPoint(self.bounds, point);
    }
}

-(void)judgeButtonTitleAndImage:(UIControlState)state space:(CGFloat)space {
    NSString *title = [self titleForState:state];
    UIFont *font = self.titleLabel.font;
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGSize maxSize = CGSizeMake(screenBounds.size.width, font.pointSize + 3);
    CGFloat titleW = [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
    UIImage *image = [self imageForState:state];
    CGFloat imgW  = image.size.width;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imgW+space/2.0), 0, (imgW+space/2.0));
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+space/2.0, 0, -titleW-space/2.0);
}

+ (UIButton *)gradientButtonFrame:(CGRect)frame title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = UIFontMake(18);
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton *)commonButtonFrame:(CGRect)frame title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.layer.cornerRadius = 4;
    button.layer.borderColor = UIColorMake(0xBDC3C4).CGColor;
    button.layer.borderWidth = KSINGLELINE_WIDTH;
    button.layer.masksToBounds = YES;
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
    button.titleLabel.font = UIFontMake(18);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:UIColorMake(0x394043) forState:UIControlStateNormal];
    return button;
}


@end
