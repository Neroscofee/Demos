//
//  ProImpleViewController.h
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/1.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passSumDelegate <NSObject>
@required
- (void)passSum:(NSString *)number;
@end

@interface ProImpleViewController : UIViewController
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, weak) id<passSumDelegate> delegate;
@end
