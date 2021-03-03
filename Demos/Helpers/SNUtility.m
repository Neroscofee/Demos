//
//  SNUtility.m
//  Demos
//
//  Created by Neroscofee on 2020/10/28.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "SNUtility.h"

@implementation SNUtility

+ (UIView *)createSeparateLine:(CGRect)frame color:(UIColor *)color {
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}

+ (void)rightSlideBackWithTarget:(id)target {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [target addGestureRecognizer:swipe];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)gr {
    if (gr.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"右滑返回");
    }
}

+ (UILabel *)createLabelWithFrame:(CGRect)rect text:(NSString *)text font:(NSInteger)fontSize bold:(BOOL)isBold textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    if (isBold) {
        label.font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        label.font = UIFontMake(fontSize);
    }
    label.textColor = textColor;
    label.textAlignment = alignment;
    label.text = text;
    return label;
}

@end
