//
//  PantsProvider.m
//  Demos
//
//  Created by Neroscofee on 2018/7/10.
//  Copyright © 2018年 Neroscofee. All rights reserved.
//

#import "PantsProvider.h"

@interface PantsProvider() <PantsProviderProtocol>

@end

@implementation PantsProvider

- (void)purchasePantsWithSize:(PantsSize)size {
    NSString *strSize;
    switch (size) {
        case PantsSizeSmall:
            strSize = @"small size";
            break;
        case PantsSizeMedium:
            strSize = @"medium size";
            break;
        case PantsSizeLarge:
            strSize = @"large size";
            break;
            
        default:
            break;
    }
    NSLog(@"You've bought some pants of %@",strSize);
}

@end
