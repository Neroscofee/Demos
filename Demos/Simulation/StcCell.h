//
//  StcCell.h
//  Demos
//
//  Created by Neroscofee on 2020/10/28.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StcModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StcCell : UITableViewCell

@property (nonatomic, strong) StcModel *model;

- (void)loadData;

@end

NS_ASSUME_NONNULL_END
