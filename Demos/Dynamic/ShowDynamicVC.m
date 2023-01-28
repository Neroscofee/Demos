//
//  ShowDynamicVC.m
//  Demos
//
//  Created by Neroscofee on 2017/11/20.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "ShowDynamicVC.h"
#import "DynamicBaseView.h"
#import "PushView.h"
#import "SnapView.h"

@interface ShowDynamicVC ()

@end

@implementation ShowDynamicVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.backgroundColor = [UIColor orangeColor];
//    @available(iOS 13.0, *)
    DynamicBaseView *baseView = nil;
    CGFloat k = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat b = [UIApplication sharedApplication].windows.firstObject.safeAreaInsets.bottom;
    CGFloat StatusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat NaviBarHeight = 44.0;
    self.view.backgroundColor = [UIColor whiteColor];
    switch (self.type) {
        case NSDynamicTypePush:
            baseView = [[PushView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_StatusBar_Height-NaviBarHeight-Fit_Bottom_Safe_Height)];
            break;
            case NSDynamicTypeSnap:
            baseView = [[SnapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_StatusBar_Height-NaviBarHeight-Fit_Bottom_Safe_Height)];
            break;
        default:
            break;
    }
    [self.view addSubview:baseView];
}

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
