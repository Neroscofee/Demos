//
//  BlockPassNumSecond.h
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/2.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^showText) (NSString *showStr);
typedef NSString *(^passString)(NSString *textString, int a);
@interface BlockPassNumSecond : UIViewController

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *returnButton;
@property (nonatomic, strong) showText returnString;
@property (nonatomic, copy) passString pstr;
//@property (nonatomic, copy) NSString *restoreString;


- (NSString *)getTextString:(passString)string;

- (void)returnTextString:(showText)string;
@end
//定义在第二个页面的一个block,现在传给第一个页面,返回值是NSString
