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
    DynamicBaseView *baseView = nil;
    CGFloat StatusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat NaviBarHeight = 44.0;
    self.view.backgroundColor = [UIColor whiteColor];
    switch (self.type) {
        case NSDynamicTypePush:
            baseView = [[PushView alloc] initWithFrame:CGRectMake(0, 0, 375, self.view.bounds.size.height-StatusBarHeight-NaviBarHeight-34)];
            break;
            case NSDynamicTypeSnap:
            baseView = [[SnapView alloc] initWithFrame:CGRectMake(0, 0, 375, self.view.bounds.size.height-64)];
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
