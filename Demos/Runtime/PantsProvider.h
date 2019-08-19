//
//  PantsProvider.h
//  Demos
//
//  Created by Neroscofee on 2018/7/10.
//  Copyright © 2018年 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,PantsSize) {
    PantsSizeSmall = 0,
    PantsSizeMedium,
    PantsSizeLarge
};

@protocol PantsProviderProtocol <NSObject>

- (void)purchasePantsWithSize:(PantsSize)size;

@end

@interface PantsProvider : NSObject

@end
