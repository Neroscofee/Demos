//
//  UIColor+RandomColor.m
//  Demo9_6
//
//  Created by 石飞龙 on 2016/12/27.
//  Copyright © 2016年 石飞龙. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)
+ (UIColor *)randomColor {
    int r = arc4random()%255;
    int g = arc4random()%255;
    int b = arc4random()%255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}
@end
