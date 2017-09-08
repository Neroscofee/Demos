//
//  BlockButtonViewController.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/3/3.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "BlockButtonViewController.h"
#import "UIButton+Block.h"

@interface BlockButtonViewController ()

@end

@implementation BlockButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 200, 100, 44)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn handleWithBlock:^{
        NSLog(@"确定被点击");
    }];
    [self.view addSubview:btn];
    
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
