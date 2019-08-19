//
//  DealerProxy.h
//  Demos
//
//  Created by Neroscofee on 2018/7/10.
//  Copyright © 2018年 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToyProvider.h"
#import "PantsProvider.h"

@interface DealerProxy : NSProxy<ToyProviderProtocol,PantsProviderProtocol>

+ (instancetype)dealerProxy;

@end
