//
//  DrawLine.h
//  Demos
//
//  Created by Neroscofee on 2017/2/24.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawLine : UIView

@property (nonatomic, strong) NSMutableArray *line;
@property (nonatomic, strong) NSMutableArray *lines;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineAlpha;
@property (nonatomic, assign) NSInteger colorValue;

@end
