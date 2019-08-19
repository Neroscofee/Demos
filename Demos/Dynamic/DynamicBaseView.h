//
//  DynamicBaseView.h
//  Demos
//
//  Created by Neroscofee on 2017/10/25.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicBaseView : UIView

@property (nonatomic, weak) UIImageView *box;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end
