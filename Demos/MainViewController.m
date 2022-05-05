//
//  MainViewController.m
//  Demos
//
//  Created by Neroscofee on 2020/11/11.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h"
#import "MainModel.h"
#import "SimuController.h"
#import "ChargeController.h"
#import "SnowViewController.h"
#import "AnimationTimer.h"
#import "FireViewController.h"
#import "BlockPassNumFirst.h"
#import "CompassController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Demos";
    
    NSLog(@"%@",[[UIScreen mainScreen] currentMode]);
    NSLog(@"%f",SCREEN_WIDTH);
    NSLog(@"%f",SCREEN_HEIGHT);
    NSLog(@"%f",Fit_NavigationBar_Height);
    NSLog(@"%f",Fit_Bottom_Safe_Height);
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        MainMoreManager *model = [[MainMoreManager alloc] init];
        _dataArray = model.moreItemModels;
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_NavigationBar_Height-Fit_Bottom_Safe_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[MainCell class] forCellReuseIdentifier:NSStringFromClass([MainCell class])];
    }
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainCell class]) forIndexPath:indexPath];
    if (!cell) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([MainCell class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MainModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.demosName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *pushVC = nil;
    MainModel *model = [self.dataArray objectAtIndex:indexPath.row];
    pushVC = [[NSClassFromString(model.controller) alloc] init];
    if (model.isFullScreen) {
        pushVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:pushVC animated:YES completion:nil];
    } else {
        pushVC.title = model.demosName;
        [self.navigationController pushViewController:pushVC animated:YES];
    }
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
