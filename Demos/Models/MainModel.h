//
//  MainModel.h
//  Demos
//
//  Created by Neroscofee on 2020/11/11.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainModel : NSObject

@property (nonatomic, copy) NSString *demosName;
@property (nonatomic, copy) NSString *controller;
@property (nonatomic, assign) BOOL isFullScreen;

@end

@interface MainMoreManager : NSObject

@property (nonatomic, strong) NSMutableArray *moreItemModels;

@end

NS_ASSUME_NONNULL_END
