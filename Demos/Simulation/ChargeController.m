//
//  ChargeController.m
//  Demos
//
//  Created by Neroscofee on 2020/10/29.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "ChargeController.h"

@interface ChargeController ()
{
    BOOL isTap;
}

@property (nonatomic, strong) UIImageView *batteryView;
@property (nonatomic, strong) UIImageView *lightningView;
@property (nonatomic, strong) UIImageView *plugView;



@end

@implementation ChargeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.view.backgroundColor = [UIColor blackColor];
    
    isTap = NO;
    
    [self.view addSubview:self.batteryView];
    [self.view addSubview:self.lightningView];
    [self.view addSubview:self.plugView];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleHit:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    // Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIImageView *)batteryView {
    if (!_batteryView) {
        _batteryView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
        _batteryView.image = UIImageMake(@"battery.png");
    }
    return _batteryView;
}

- (UIImageView *)lightningView {
    if (!_lightningView) {
        _lightningView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-23.5, SCREEN_HEIGHT-90-40, 45, 45)];
        _lightningView.image = UIImageMake(@"shandian.png");
        _lightningView.hidden = YES;
    }
    return _lightningView;
}

- (UIImageView *)plugView {
    if (!_plugView) {
        _plugView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT-90, 100, 100)];
        _plugView.image = UIImageMake(@"jiantou.png");
        _plugView.hidden = YES;
    }
    return _plugView;
}

- (void)doubleHit:(UIGestureRecognizer *)gesture {
    if (isTap) {
//        self.view.backgroundColor = [UIColor blackColor];
        self.lightningView.hidden = YES;
        self.plugView.hidden = YES;
        isTap = NO;
    } else {
//        self.view.backgroundColor = [UIColor orangeColor];
        self.lightningView.hidden = NO;
        self.plugView.hidden = NO;
        isTap = YES;
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

