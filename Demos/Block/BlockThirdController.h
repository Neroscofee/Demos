//
//  BlockThirdController.h
//  Demos
//
//  Created by Neroscofee on 2020/9/22.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

typedef NSString * _Nullable (^PassString)(NSString *string);

@interface BlockThirdController : UIViewController

@property (nonatomic, copy) PassString passString;

@end

NS_ASSUME_NONNULL_END
