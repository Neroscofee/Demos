//
//  MainModel.m
//  Demos
//
//  Created by Neroscofee on 2020/11/11.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

@end

@implementation MainMoreManager

- (NSMutableArray *)moreItemModels {
    if (!_moreItemModels) {
        _moreItemModels = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Demos" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in array) {
            MainModel *model = [[MainModel alloc] init];
            model.demosName = dic[@"demosName"];
            model.controller = dic[@"controller"];
            model.isFullScreen = [dic[@"isFullScreen"] boolValue];
            [_moreItemModels addObject:model];
        }
    }
    return _moreItemModels;
}

@end
