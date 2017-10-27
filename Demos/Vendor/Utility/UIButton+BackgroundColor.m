//
//  UIButton+BackgroundColor.m
//  Demos
//
//  Created by Neroscofee on 2017/1/6.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "UIButton+BackgroundColor.h"

@implementation UIButton (BackgroundColor)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
//    self.backgroundColor = color;
    [self setBackgroundImage:[UIButton imageWithColor:color] forState:state];
}

+ (UIImage *)imageWithColor:(UIColor *)color {

    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    

    
    
    return image;
}

- (UIImage *)imageForColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
    //    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //    UIGraphicsBeginImageContext(rect.size);
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    //    CGContextSetFillColorWithColor(context, [color CGColor]);
    //    CGContextFillRect(context, rect);
    //两年半iOS开发经验,具有复杂模块编程经验
    //    熟练掌握Objective-C,了解Swift语言基础
    //    熟练移动端图形界面布局及相关的多线程和网络编程
    //了解iOS平台架构,各种常用API及SDK,深入理解OC内存管理机制
    //对iOS性能调优,防崩溃有一定理解
    //关注新兴技术,
    //搜房帮
    //项目描述：
    /*
     项目描述：
     搜房帮是一款针对房产经纪人的软件，提供给房产经纪人便利的卖房渠道
     项目职责：
     负责开发搜房帮卖新房模块 历经3.6.0至5.1.2共计20多个版本的迭代
     项目业绩：
     没有出过任何重大线上bug事故
     */
    //    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
}



@end
