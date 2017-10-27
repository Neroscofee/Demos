//
//  DownloadIndicator.h
//  Demos
//
//  Created by Neroscofee on 2017/1/9.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadIndicator : UIView

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat value;
@property (nonatomic, strong) UILabel *textLable;

@end
