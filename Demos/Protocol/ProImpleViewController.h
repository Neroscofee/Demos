//
//  ProImpleViewController.h
//  Demos
//
//  Created by Neroscofee on 2017/3/1.
//  Copyright © 2017年 Neroscofee. All rights reserved.
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
