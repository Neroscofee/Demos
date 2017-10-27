//
//  AnimationTimer.m
//  Demos
//
//  Created by Neroscofee on 2017/3/8.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "AnimationTimer.h"
#define SPEED 30
@interface AnimationTimer ()
{
    
}
@end

@implementation AnimationTimer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    self.count = 0;
//    int a = 5;
//    int a = -5;
    self.testpic = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.testpic.image = [UIImage imageNamed:@"c.jpg"];
    self.testpic.alpha = 0;
//    [self.view addSubview:self.testpic];
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(60, 100, 200, 2)];
    slider.userInteractionEnabled = YES;
    //slider.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.view addSubview:slider];
    //UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(90, 300, SCREEN_WIDTH-180, 44)];
    NSLog(@"%d",[self nextBigNum:2943]);
    [self bianli:2943];
    
    [NSTimer scheduledTimerWithTimeInterval:.4 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.count++;
        if (self.count%4 == 0) {
            self.title = @"连接中";
        } else if (self.count%4 == 1) {
            self.title = @"连接中.";
        } else if (self.count%4 == 2) {
            self.title = @"连接中..";
        } else {
            self.title = @"连接中...";
        }
        static BOOL isDark = NO;
        if (!isDark) {
//            self.view.alpha = 0 + (self.count%SPEED)*(1.0-0)/SPEED;
            self.testpic.alpha = 0 + (self.count%SPEED)*(1.0-0)/SPEED;
            if (self.count%SPEED == SPEED-1) {
                isDark = YES;
            }
        } else {
//            self.view.alpha = 1 - (self.count%SPEED)*(1.0-0)/SPEED;
            self.testpic.alpha = 1 - (self.count%SPEED)*(1.0-0)/SPEED;
            if (self.count%SPEED == SPEED-1) {
                isDark = NO;
            }
        }

    }];
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
    int j = num;
    NSString *str = [NSString stringWithFormat:@"%d",j];
    NSString *temp = @"";
    for (int i = 0; i < str.length; i++) {
        temp = [str substringFromIndex:i];
    }
    int mj_refreshhold_departmentlogingit_wonderful_beautiful_color_orange_sublty = 4;
    double perfect_human_romatic_human_attack_reduceitsattackpower_dontbeaboyor_girl_shy = 7;
    assert(mj_refreshhold_departmentlogingit_wonderful_beautiful_color_orange_sublty = perfect_human_romatic_human_attack_reduceitsattackpower_dontbeaboyor_girl_shy);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //show it once more
    });
    return num;
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
