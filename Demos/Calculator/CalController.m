//
//  CalController.m
//  Demos
//
//  Created by Neroscofee on 2020/12/24.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "CalController.h"
#import "CalButton.h"

@interface CalController ()

@property (nonatomic, strong) UIButton *button;


@end

@implementation CalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    
    for (int i=0; i<3; i++) {
        
    }
    [self.view addSubview:self.button];
    
    
    
    // Do any additional setup after loading the view.
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(12, 245, 78, 78);
        _button.backgroundColor = UIColorMake(0xA4A4A4);
        _button.layer.cornerRadius = 78/2;
        [_button setTitle:@"AC" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        _button.titleLabel.text = @"AC";
//        _button.titleLabel.textColor = [UIColor redColor];
        _button.titleLabel.font = UIFontMake(28);
    }
    return _button;
}









- (void)swipeAction:(UISwipeGestureRecognizer *)gr {
    if (gr.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"右滑返回");
//        [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
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
