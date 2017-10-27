//
//  ActionButtonViewController.m
//  Demos
//
//  Created by Neroscofee on 2017/3/3.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "ActionButtonViewController.h"
#import "UIButton+Action.h"
#import <objc/runtime.h>

@interface ActionButtonViewController ()

@end

@implementation ActionButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 200, 100, 44) title:@"好好学习" fontSize:20 actionBlock:^(UIButton *button) {
        button.backgroundColor = [UIColor randomColor];
        self.view.backgroundColor = [UIColor randomColor];
        if ([button.currentTitle isEqualToString:@"好好学习"]) {
            [button setTitle:@"天天向上" forState:UIControlStateNormal];
        } else {
            [button setTitle:@"好好学习" forState:UIControlStateNormal];
        }
    }];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [self getiOSPrivateAPI];
    NSString *name = @"sgg";
    name = @"ffff";
    
}

- (void)getiOSPrivateAPI {
    NSString *className = NSStringFromClass([UIButton class]);
    const char *cClassName = [className UTF8String];
    id theClass = objc_getClass(cClassName);
    unsigned int outCount;
    Method *m = class_copyMethodList(theClass, &outCount);
    NSLog(@"%d",outCount);
    for (int i = 0; i < outCount; i++) {
        SEL selector = method_getName(*(m+i));
        NSString *nameString = NSStringFromSelector(selector);
        NSLog(@"%@",nameString);
    }
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
