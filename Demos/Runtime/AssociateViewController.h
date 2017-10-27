//
//  AssociateViewController.h
//  Demos
//
//  Created by Neroscofee on 2017/3/3.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssociateViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

/**
 *  我的数组
 */
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end
