//
//  ProtocolViewController.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/1.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "ProtocolViewController.h"
#import "ProImpleViewController.h"


@interface ProtocolViewController ()<passSumDelegate>

@end

@implementation ProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"协议传值";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.midLable];
    [self.view addSubview:self.midButton];
    // Do any additional setup after loading the view.
}

- (UILabel *)midLable {
    if (!_midLable) {
        _midLable = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 150, 100, 44)];
        _midLable.backgroundColor = [UIColor redColor];
        _midLable.textAlignment = NSTextAlignmentCenter;
    }
    return _midLable;
}

- (UIButton *)midButton {
    if (!_midButton) {
        _midButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _midButton.frame = CGRectMake((SCREEN_WIDTH-70)/2, 200, 70, 44);
        [_midButton setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_midButton addTarget:self action:@selector(pushNextVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _midButton;
}

- (void)pushNextVC {
    ProImpleViewController *pvc = [[ProImpleViewController alloc] init];
    pvc.delegate = self;
    [self.navigationController pushViewController:pvc animated:YES];
}

- (void)passSum:(NSString *)number {
    self.midLable.text = number;
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
