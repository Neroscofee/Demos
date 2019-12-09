//
//  NSFrameworkManager.h
//  Demos
//
//  Created by Neroscofee on 2019/12/8.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^WelcomeFrameworkHandle)(void);
typedef void(^MainFrameworkHandle)(void);

NS_ASSUME_NONNULL_BEGIN

@interface NSFrameworkManager : NSObject

@property (nonatomic, copy) WelcomeFrameworkHandle welcomeFrameworkHandle;
@property (nonatomic, copy) MainFrameworkHandle mainFrameworkHandle;

+ (NSFrameworkManager *)sharedInstance;

- (void)toWelcomeFramework;
- (void)toMainFramework;

@end

NS_ASSUME_NONNULL_END
