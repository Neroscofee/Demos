//
//  SnowViewController.m
//  Demos
//
//  Created by Neroscofee on 2017/4/28.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "SnowViewController.h"

@interface SnowViewController ()
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation SnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    self.count = 0;
//    [NSTimer scheduledTimerWithTimeInterval:1/5 target:self selector:@selector(Snow:) userInfo:nil repeats:YES];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1/5 target:self selector:@selector(Snow:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view. 
}

- (void)swipeAction:(UISwipeGestureRecognizer *)gr {
    if (gr.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"右滑返回");
//        [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:^{
            [self.timer invalidate];
        }];
    }
}

- (void)Snow:(NSTimer *)timer {
    NSLog(@"%lu",(unsigned long)self.view.subviews.count);
    UIImageView *snow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snow"]];
    self.count++;
    snow.tag = self.count;
    NSInteger snowWidth = 7+arc4random()%20;
    NSInteger positionX = arc4random()%(NSInteger)SCREEN_WIDTH;
    if (positionX+snowWidth > SCREEN_WIDTH) {
        positionX = positionX - snowWidth;
    }
    snow.frame = CGRectMake(positionX, -snowWidth, snowWidth, snowWidth);
    [self.view addSubview:snow];
    
    CGFloat velocity = (arc4random()%10)+1;//下雪速度控制,由arc4random()的模余来判断
    NSInteger positionXD = arc4random()%(NSInteger)SCREEN_WIDTH;
    [UIView animateWithDuration:velocity animations:^{
        snow.frame = CGRectMake(positionXD, SCREEN_HEIGHT-snowWidth, snowWidth, snowWidth);
    } completion:^(BOOL finished) {
//        NSLog(@"%f",(float)snowWidth);
        float temp = snowWidth;
        float disappearTime = temp/7;
//        NSLog(@"%f",disappearTime);
//        NSInteger disappearTime = 2;
        [self performSelector:@selector(snowDisapper:) withObject:snow afterDelay:disappearTime];
        
    }];

}

- (void)snowDisapper:(UIImageView *)snow {
//    NSLog(@"----%ld----",(long)snow.tag);
    [snow removeFromSuperview];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
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
