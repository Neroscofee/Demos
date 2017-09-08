//
//  AssociateViewController.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/3.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "AssociateViewController.h"
#import <objc/runtime.h>

@interface AssociateViewController ()<UIAlertViewDelegate>

@end
static char onlyKey;
@implementation AssociateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initArray];
//    [self createDataSource];
    [self.view addSubview:self.tableView];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [self.tableView reloadData];
//}

- (void)initArray {
    self.dataArray = [NSArray array];
    NSMutableArray *muarr = [[NSMutableArray alloc] init];
    for (int i = 'A'; i <= 'Z'; i++) {
        [muarr addObject:[NSString stringWithFormat:@"%c",i]];
    }
    self.dataArray = [NSArray arrayWithArray:muarr];
}

//- (NSArray *)dataArray {
//    if (!_dataArray) {
//        _dataArray = [NSArray array];
//        NSMutableArray *muarr = [[NSMutableArray alloc] init];
//        for (int i = 'A'; i < 'Z'; i++) {
//            [muarr addObject:[NSString stringWithFormat:@"%c",i]];
//        }
//        [_dataArray arrayByAddingObjectsFromArray:muarr];
//    }
//    return _dataArray;
//}

- (void)createDataSource {
    self.dataArray = [NSArray array];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 'A'; i <='Z'; i++) {
        [arr addObject:[NSString stringWithFormat:@"%c",i]];
    }
    self.dataArray = arr;//
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.separatorInset = UIEdgeInsetsZero;
        //既不回头何必不忘既然无缘何须誓言今日种种似水无痕明夕何夕君已陌路
        /*
         */
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"这里是%@楼",cell.textLabel.text] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.delegate = self;
    objc_setAssociatedObject(alertView, &onlyKey, cell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [alertView show];
//    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"这里是楼" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    [ac addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell.textLabel.textColor = [UIColor redColor];
//    }]];
//    [ac addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell.textLabel.textColor = [UIColor redColor];
//    }]];
//    [self presentViewController:ac animated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
//        NSIndexPath *indexPath = objc_getAssociatedObject(alertView, &onlyKey);
//        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//        cell.textLabel.textColor = [UIColor redColor];
        UITableViewCell *color = objc_getAssociatedObject(alertView, &onlyKey);
        color.textLabel.textColor = [UIColor redColor];
//        NSLog(@"%ld",(long)indexPath.row+1);
    }
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%ld被点击了", (long)indexPath.row);
//    UITableViewCell *myCell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"%@被点击了",myCell.textLabel.text);
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
