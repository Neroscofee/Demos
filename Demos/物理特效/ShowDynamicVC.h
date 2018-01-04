//
//  ShowDynamicVC.h
//  Demos
//
//  Created by Neroscofee on 2017/11/20.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NSDynamicTypePush = 0,
    NSDynamicTypeSnap,
    NSDynamicTypeSpring,
    NSDynamicTypeAttachment,
} NSDynamicType;

@interface ShowDynamicVC : UIViewController
@property (nonatomic, assign) NSDynamicType type;

@end
