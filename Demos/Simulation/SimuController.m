//
//  SimuController.m
//  Demos
//
//  Created by Neroscofee on 2020/10/26.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "SimuController.h"
#import "StcController.h"

@interface SimuController ()

@property (nonatomic, strong) UITextField *tf1;
@property (nonatomic, strong) UITextField *tf2;
@property (nonatomic, strong) UITextField *tf3;
@property (nonatomic, strong) UITextField *tf4;
@property (nonatomic, strong) UITextField *tf5;
@property (nonatomic, strong) UIButton *button;


@end

@implementation SimuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Simulation";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tf1];
    [self.view addSubview:self.tf2];
    [self.view addSubview:self.tf3];
    [self.view addSubview:self.tf4];
    [self.view addSubview:self.tf5];
    
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(anotherVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // Do any additional setup after loading the view.
}

- (UITextField *)tf1 {
    if (!_tf1) {
        _tf1 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, 40, 120, 40)];
        _tf1.placeholder = @"11.4小时";
        _tf1.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf1;
}

- (UITextField *)tf2 {
    if (!_tf2) {
        _tf2 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, CGRectGetMaxY(self.tf1.frame)+10, 120, 40)];
        _tf2.placeholder = @"13.0天";
        _tf2.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf2;
}

- (UITextField *)tf3 {
    if (!_tf3) {
        _tf3 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, CGRectGetMaxY(self.tf2.frame)+10, 120, 40)];
        _tf3.placeholder = @"共13次";
        _tf3.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf3;
}

- (UITextField *)tf4 {
    if (!_tf4) {
        _tf4 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, CGRectGetMaxY(self.tf3.frame)+10, 120, 40)];
        _tf4.placeholder = @"7天";
        _tf4.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf4;
}

- (UITextField *)tf5 {
    if (!_tf5) {
        _tf5 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, CGRectGetMaxY(self.tf4.frame)+10, 120, 40)];
        _tf5.placeholder = @"2020.10";
        _tf5.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf5;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake((SCREEN_WIDTH-60)/2, 300, 60, 30);
        _button.layer.cornerRadius = 10;
        _button.layer.borderWidth = 0.5;
        _button.layer.borderColor = [UIColor blackColor].CGColor;
        [_button setTitle:@"确定" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button;
}

- (void)anotherVC {
    StcController *vc = [[StcController alloc] init];
    vc.str1 = self.tf1.text;
    vc.str2 = self.tf2.text;
    vc.str3 = self.tf3.text;
    vc.str4 = self.tf4.text;
    vc.str5 = self.tf5.text;
    
    [self.navigationController pushViewController:vc animated:YES];
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
