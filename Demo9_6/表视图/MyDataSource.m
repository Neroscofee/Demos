//
//  MyDataSource.m
//  Demo9_6
//
//  Created by 石飞龙 on 2016/12/20.
//  Copyright © 2016年 石飞龙. All rights reserved.
//

#import "MyDataSource.h"

@implementation MyDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",(long)indexPath.row];
    return cell;
}

@end
