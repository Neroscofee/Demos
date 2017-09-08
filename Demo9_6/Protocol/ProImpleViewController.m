//
//  ProImpleViewController.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/1.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "ProImpleViewController.h"

@interface ProImpleViewController ()

@end

@implementation ProImpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"***";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self initBackButton];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, 200, 200, 44)];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.backgroundColor = [UIColor orangeColor];
        _textField.layer.cornerRadius = 5;
    }
    return _textField;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}

- (void)initBackButton {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 50, 44);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backForward) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)backForward {
    if (self.delegate && [self.delegate respondsToSelector:@selector(passSum:)]) {
        [self.delegate passSum:self.textField.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
