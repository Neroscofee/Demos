//
//  SearchData.h
//  Demo9_6
//
//  Created by 石飞龙 on 2016/12/21.
//  Copyright © 2016年 石飞龙. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, TPType) {
    TPTypeDevice = 0,
    TPTypeSoft,
    TPTypeOther,
};

@interface SearchData : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) TPType type;
+ (NSArray *)demoData;

@end
