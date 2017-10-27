//
//  BlockResearch.h
//  Demos
//
//  Created by Neroscofee on 2017/3/2.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockResearch : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSMutableArray *dataArray;


@end
