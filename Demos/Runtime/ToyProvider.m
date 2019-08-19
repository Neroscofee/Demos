//
//  ToyProvider.m
//  Demos
//
//  Created by Neroscofee on 2018/7/10.
//  Copyright © 2018年 Neroscofee. All rights reserved.
//

#import "ToyProvider.h"

@interface ToyProvider () <ToyProviderProtocol>

@end

@implementation ToyProvider

- (void)purchaseToyWithTitle:(NSString *)toyTitle {
    NSLog(@"You've bought a %@",toyTitle);
}

@end
