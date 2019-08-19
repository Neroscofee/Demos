//
//  ToyProvider.h
//  Demos
//
//  Created by Neroscofee on 2018/7/10.
//  Copyright © 2018年 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ToyProviderProtocol <NSObject>

- (void)purchaseToyWithTitle:(NSString *)toyTitle;

@end

@interface ToyProvider : NSObject

@end
