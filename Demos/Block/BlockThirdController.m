//
//  BlockThirdController.m
//  Demos
//
//  Created by Neroscofee on 2020/9/22.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "BlockThirdController.h"

@interface BlockThirdController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;

@end

@implementation BlockThirdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(returnPrevious:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, 300, 200, 44)];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.borderStyle = UITextBorderStyleLine;
    }
    return _textField;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake((SCREEN_WIDTH-60)/2, 400, 60, 40);
        _button.backgroundColor = [UIColor orangeColor];
        [_button setTitle:@"返回" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _button;
}

- (void)returnPrevious:(UIButton *)sender {
    self.passString(self.textField.text);
    [self.navigationController popViewControllerAnimated:YES];
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
