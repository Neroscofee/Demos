//
//  BlockPassNumSecond.m
//  Demos
//
//  Created by Neroscofee on 2017/3/2.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "BlockPassNumSecond.h"

@interface BlockPassNumSecond ()
{
    BOOL isShow;
}

@end
static NSString *restoreString = @"";
@implementation BlockPassNumSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.returnButton];
    
    isShow = NO;
    
    UIControl *control = [[UIControl alloc] initWithFrame:self.view.bounds];
    [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control];
    [self.view sendSubviewToBack:control];
    // Do any additional setup after loading the view.
    [self.textField addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];
    //NSLog(@"************%d************",[self bianli:79310]);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"frame"]) {
        CGRect frame = [[change objectForKey:NSKeyValueChangeNewKey] CGRectValue];
        NSString *str = NSStringFromCGRect(frame);
        NSLog(@"%@",str);
        self.returnButton.frame = CGRectMake(self.returnButton.frame.origin.x, CGRectGetMaxY(frame)+10, self.returnButton.frame.size.width, self.returnButton.frame.size.height);
    }
}

- (int)nextBigNum:(int)num {
    NSString *str = [NSString stringWithFormat:@"%d",num];
    for (long i = str.length; i >= 0; i--) {
        if (i == 0) {
            NSLog(@"没有找到");
            return -1;
        }//728
        NSRange lastRange = {i-1,1};
        NSRange upRange = NSMakeRange(i-2, 1);
        NSString *lastNum = [str substringWithRange:lastRange];
        NSString *upNum = [str substringWithRange:upRange];
        if (upNum.intValue < lastNum.intValue) {
            str = [str stringByReplacingOccurrencesOfString:lastNum withString:upNum options:0 range:lastRange];
            str = [str stringByReplacingOccurrencesOfString:upNum withString:lastNum options:0 range:upRange];
            break;
        }
    }
    return str.intValue;
}

- (int)bianli:(int)num {
    NSString *str = [NSString stringWithFormat:@"%d",num];
    NSString *temp = @"";
    NSMutableArray *rightPart = [NSMutableArray array];
    NSMutableArray *leftPart = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    static int t = 0;
    static int k = 0;
    bool sepatate = NO;//9243
    for (int i = (int)(str.length-1); i >= 0; i--) {
        char c = [str characterAtIndex:i];
        temp = [NSString stringWithFormat:@"%c",c];
        if ([temp intValue] >= t && !sepatate) {
            t = [temp intValue];
            [rightPart addObject:temp];
        } else {
            [leftPart addObject:temp];
            sepatate = YES;
        }
    }
    tempArr = [NSMutableArray arrayWithArray:leftPart];
    [leftPart removeAllObjects];
    for (int i = (int)(tempArr.count-1); i >= 0; i--) {
        [leftPart addObject:[tempArr objectAtIndex:i]];
    }
    k = [[leftPart objectAtIndex:leftPart.count-1] intValue];
    [leftPart removeObjectAtIndex:leftPart.count-1];
    [rightPart sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 intValue] > [obj2 intValue];
    }];
    for (int i = 0; i < rightPart.count; i++) {
        t =  [[rightPart objectAtIndex:i] intValue];
        if (t > k) {// t = 9 k = 2
            [leftPart addObject:[NSString stringWithFormat:@"%d",t]];//93
            [rightPart removeObjectAtIndex:i];//34 0139
            [rightPart addObject:[NSString stringWithFormat:@"%d",k]];//42
            break;
        }
    }
    [rightPart sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 intValue] > [obj2 intValue];
    }];
    NSString *newStr = @"";
    for (int i = 0; i < leftPart.count; i++) {
        newStr = [newStr stringByAppendingString:[NSString stringWithFormat:@"%@",[leftPart objectAtIndex:i]]];
    }
    for (int i = 0; i < rightPart.count; i++) {
        newStr = [newStr stringByAppendingString:[NSString stringWithFormat:@"%@",[rightPart objectAtIndex:i]]];
    }
    num = [newStr intValue];
    t = 0;
    k = 0;
    return num;
}


- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSString *str1 = NSStringFromCGRect(keyboardRect);
    NSLog(@"-------%@",str1);
    
    NSString *str = NSStringFromCGRect(self.textField.frame);
    NSLog(@"*******%@",str);
    
    if (self.textField.frame.origin.y == 450) {
        isShow = NO;
    } else {
        isShow = YES;
    }
//    keyboardRect = [self.textField convertRect:keyboardRect fromView:nil];
//    NSString *str2= NSStringFromCGRect(keyboardRect);
//    NSLog(@"*******%@",str2);
//    
//    CGFloat keyboardTop = keyboardRect.origin.y;
//    CGRect newTextFieldFrame = self.textField.bounds;
//    newTextFieldFrame.size.height = keyboardTop - self.textField.bounds.origin.y;
//    
//    NSTimeInterval animationDuration;
//    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:animationDuration];
//    self.textField.frame = newTextFieldFrame;
//    [UIView commitAnimations];
    
    NSTimeInterval animationDuration;
    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [UIView animateWithDuration:animationDuration animations:^{
        if (!isShow) {
            self.textField.frame = CGRectMake(self.textField.frame.origin.x, self.textField.frame.origin.y-keyboardRect.size.height, self.textField.frame.size.width, self.textField.frame.size.height);
//            isShow = !isShow;
        } else {
            self.textField.frame = CGRectMake(self.textField.frame.origin.x, self.textField.frame.origin.y+keyboardRect.size.height, self.textField.frame.size.width, self.textField.frame.size.height);
        }
//        isShow = !isShow;
//        self.textField.frame = CGRectMake(self.textField.frame.origin.x, self.textField.frame.origin.y-keyboardRect.size.height, self.textField.frame.size.width, self.textField.frame.size.height);
//        NSLog(@"%@",self.textField);
    }];
    
//    [UIView animateWithDuration:animationDuration animations:^{
////        self.view.backgroundColor = [UIColor redColor];
//    } completion:^(BOOL finished) {
//        self.textField.frame = CGRectMake(self.textField.frame.origin.x, self.textField.frame.origin.y-keyboardRect.size.height, self.textField.frame.size.width, self.textField.frame.size.height);
//    }];
    
    
    

}

- (void)keyboardWillHide:(NSNotification *)notification {
    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSString *str1 = NSStringFromCGRect(keyboardRect);
    NSLog(@"%@",str1);
//    NSLog(@"%@",self.textField.frame.origin);
    NSTimeInterval animationDuration;
    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
//    self.textField.frame = self.textField.bounds;
    self.textField.frame = CGRectMake(self.textField.frame.origin.x, self.textField.frame.origin.y+keyboardRect.size.height, self.textField.frame.size.width, self.textField.frame.size.height);
    [UIView commitAnimations];
    
}

- (void)controlClick {
    [self.textField resignFirstResponder];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 450, 100, 25)];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.font = [UIFont systemFontOfSize:18];
        _textField.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _textField;//既不回头何必不忘既然无缘何须誓言
}

- (UIButton *)returnButton {
    if (!_returnButton) {
        _returnButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, CGRectGetMaxY(self.textField.frame)+10, 60, 44)];
        _returnButton.backgroundColor = [UIColor redColor];
        [_returnButton setTitle:@"返回" forState:UIControlStateNormal];
        _returnButton.layer.cornerRadius = 5;
        [_returnButton addTarget:self action:@selector(returnBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnButton;
}

- (void)returnTextString:(showText)string {
    self.returnString = string;
}

- (NSString *)getTextString:(passString)string {
    self.pstr = string;
    return self.pstr(restoreString,0);
}

- (void)returnBack {
    restoreString = self.textField.text;
//    restoreString = [NSString stringWithFormat:@"%d",[self bianli:[self.textField.text intValue]]];
    if (self.pstr) {
        [self getTextString:self.pstr];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textField removeObserver:self forKeyPath:@"frame"];
}

- (void)dealloc {
    NSLog(@"111");
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
