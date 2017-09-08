//
//  BlockPassNumFirst.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/2.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "BlockPassNumFirst.h"
#import "BlockPassNumSecond.h"

@interface BlockPassNumFirst ()

@end

@implementation BlockPassNumFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Block传值";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showLabel];
    [self.view addSubview:self.showButton];
    // Do any additional setup after loading the view.
}

- (UILabel *)showLabel {
    if (!_showLabel) {
        //_showLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, 100, 150, 15)];
        _showLabel = [[UILabel alloc] init];
        _showLabel.bounds = CGRectMake(0, 0, 150, 15);
        _showLabel.text = @"0";
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.font = [UIFont systemFontOfSize:18];
        [_showLabel sizeToFit];

    }
    return _showLabel;
}

- (UIButton *)showButton {
    if (!_showButton) {
        _showButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, 200, 60, 44)];
        _showButton.backgroundColor = [UIColor redColor];
        [_showButton setTitle:@"确定" forState:UIControlStateNormal];
        _showButton.layer.cornerRadius = 5;
        [_showButton addTarget:self action:@selector(goToNextVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showButton;
}

- (void)goToNextVC {
    BlockPassNumSecond *pns = [[BlockPassNumSecond alloc] init];
//    [pns returnTextString:^(NSString *showStr) {
//        self.showLabel.text = showStr;
//    }];
//    pns.pstr = ^(NSString *textString, int a) {
//        return [NSString stringWithFormat:@"%d%@",a,textString];
//    };
//    self.showLabel.text = [pns getTextString:^NSString *(NSString *textString, int a) {
//        return [NSString stringWithFormat:@"%d%@",a,textString];
//    }];
    [self presentViewController:pns animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    BlockPassNumSecond *pns = [[BlockPassNumSecond alloc] init];
    self.showLabel.text = [pns getTextString:^NSString *(NSString *textString, int a) {
        return [NSString stringWithFormat:@"%d%@",a,textString];
    }];
    [_showLabel sizeToFit];//自适应,很有意思!
    _showLabel.center = CGPointMake(SCREEN_WIDTH/2, 100);
    //[self.showLabel sizeToFit];
    
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
