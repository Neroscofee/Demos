//
//  BlockResearch.h
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/2.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockResearch : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSMutableArray *dataArray;


@end
