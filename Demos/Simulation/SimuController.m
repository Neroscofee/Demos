//
//  SimuController.m
//  Demos
//
//  Created by Neroscofee on 2020/10/26.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "SimuController.h"
#import "StcController.h"
#import "SiwxController.h"

@interface SimuController ()

@property (nonatomic, strong) UITextField *tf1;
@property (nonatomic, strong) UITextField *tf2;
@property (nonatomic, strong) UITextField *tf3;
@property (nonatomic, strong) UITextField *tf4;
@property (nonatomic, strong) UITextField *tf5;
@property (nonatomic, strong) UITextField *tf6;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UITextField *tf7;
@property (nonatomic, strong) UITextField *tf8;
@property (nonatomic, strong) UITextField *tf9;
@property (nonatomic, strong) UIButton *forwardButton;

@end

@implementation SimuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Simulation";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
//    [UIScreen mainScreen].brightness = 0.5;
    
    [self.view addSubview:self.tf1];
    [self.view addSubview:self.tf2];
    [self.view addSubview:self.tf3];
    [self.view addSubview:self.tf4];
    [self.view addSubview:self.tf5];
    [self.view addSubview:self.tf6];
    [self.view addSubview:self.tf7];
    [self.view addSubview:self.tf8];
    [self.view addSubview:self.tf9];
    [self.view addSubview:self.button];
    [self.view addSubview:self.forwardButton];
    
    [self.button addTarget:self action:@selector(anotherVC) forControlEvents:UIControlEventTouchUpInside];
    [self.forwardButton addTarget:self action:@selector(forwardVC) forControlEvents:UIControlEventTouchUpInside];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe1.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipe1];
    
    
    [self.tf7 addObserver:self forKeyPath:@"tf7" options:NSKeyValueObservingOptionNew context:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
}

- (void)dealloc {
    [self.tf7 removeObserver:self forKeyPath:@"tf7"];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSString *str1 = NSStringFromCGRect(keyboardRect);
    NSLog(@"%@",str1);
    //
    NSTimeInterval anidur;
    anidur = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    NSLog(@"---%f",anidur);
    [UIView animateWithDuration:anidur animations:^{
        self.tf7.frame = CGRectMake(self.tf7.frame.origin.x, self.tf7.frame.origin.y-keyboardRect.size.height, self.tf7.frame.size.width, self.tf7.frame.size.height);//
    }];
    
    
}

- (void)swipeAction:(UISwipeGestureRecognizer *)gr {
    CGFloat bright = [UIScreen mainScreen].brightness;
    NSLog(@"%f",bright);
    
    if (gr.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"向上滑动");
        bright = bright + 0.1;
        if (bright >= 1.0) {
            bright = 1.0;
        }
        [UIScreen mainScreen].brightness = bright;
    } else if (gr.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"向下滑动");
        bright = bright - 0.1;
        if (bright <= 0) {
            bright = 0;
        }
        [UIScreen mainScreen].brightness = bright;
    } else if (gr.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"向左滑动");
    } else if (gr.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"向右滑动");
    }
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

- (UITextField *)tf6 {
    if (!_tf6) {
        _tf6 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, CGRectGetMaxY(self.tf5.frame)+10, 120, 40)];
        _tf6.placeholder = @"王小明";
        _tf6.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf6;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake((SCREEN_WIDTH-60)/2, CGRectGetMaxY(self.tf6.frame)+20, 60, 30);
        _button.layer.cornerRadius = 10;
        _button.layer.borderWidth = 0.5;
        _button.layer.borderColor = [UIColor blackColor].CGColor;
        [_button setTitle:@"确定" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button;
}

- (UITextField *)tf7 {
    if (!_tf7) {
        _tf7 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-250)/2, CGRectGetMaxY(self.button.frame)+40, 250, 40)];
        _tf7.placeholder = @"mark";
        _tf7.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf7;
}

- (UITextField *)tf8 {
    if (!_tf8) {
        _tf8 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-250)/2, CGRectGetMaxY(self.tf7.frame)+10, 250, 40)];
        _tf8.placeholder = @"3月3日";
        _tf8.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf8;
}

- (UITextField *)tf9 {
    if (!_tf9) {
        _tf9 = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-250)/2, CGRectGetMaxY(self.tf8.frame)+10, 250, 40)];
        _tf9.placeholder = @"a period of physical exercise that you do to keep fit";
        _tf9.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _tf9;
}

- (UIButton *)forwardButton {
    if (!_forwardButton) {
        _forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forwardButton.frame = CGRectMake((SCREEN_WIDTH-60)/2, CGRectGetMaxY(self.tf9.frame)+20, 60, 30);
        _forwardButton.layer.cornerRadius = 10;
        _forwardButton.layer.borderWidth = 0.5;
        _forwardButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_forwardButton setTitle:@"确定" forState:UIControlStateNormal];
        [_forwardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _forwardButton;
}

- (void)anotherVC {
    StcController *vc = [[StcController alloc] init];
    vc.str1 = self.tf1.text;
    vc.str2 = self.tf2.text;
    vc.str3 = self.tf3.text;
    vc.str4 = self.tf4.text;
    vc.str5 = self.tf5.text;
    vc.str6 = self.tf6.text;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)forwardVC {
    SiwxController *vc = [[SiwxController alloc] init];
    vc.headString = self.tf7.text;
    vc.dateString = self.tf8.text;
    vc.longString = self.tf9.text;

    [self.navigationController pushViewController:vc animated:YES];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.tf1 resignFirstResponder];
//    [self.tf2 resignFirstResponder];
//    [self.tf3 resignFirstResponder];
//    [self.tf4 resignFirstResponder];
//    [self.tf5 resignFirstResponder];
//    [self.tf6 resignFirstResponder];
//    [self.tf7 resignFirstResponder];
//    [self.tf8 resignFirstResponder];
//    [self.tf9 resignFirstResponder];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
