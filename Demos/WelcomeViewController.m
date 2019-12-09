//
//  WelcomeViewController.m
//  Demos
//
//  Created by Neroscofee on 2019/12/7.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import "WelcomeViewController.h"
#import "NSFrameworkManager.h"


@interface WelcomeViewController ()

@property (nonatomic, strong) UIView *welcomeView;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.welcomeView];
    [self createWelcomeView];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (UIView *)welcomeView {
    if (!_welcomeView) {
        _welcomeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _welcomeView.backgroundColor = [UIColor whiteColor];
    }
    return _welcomeView;
}

- (void)createWelcomeView {
    CGFloat statPoint = (SCREEN_HEIGHT-392)/2;
    for (int i = 0; i<7; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i]]];
        imgView.bounds = CGRectMake(0, 0, 568, 20);
        imgView.center = CGPointMake(self.view.bounds.size.width/2, statPoint+62*i);
        imgView.alpha = 0;
        imgView.tag = i;
        [self.welcomeView addSubview:imgView];
    }
    [self textImgAnimation];
}

//文字动画
-(void)textImgAnimation{
    static int i = 0;
    [UIView animateWithDuration:1.1 animations:^{
        for (UIImageView *imgView in self.welcomeView.subviews) {
            if (imgView.tag == i) {
                imgView.alpha = 1;
            }
        }
    } completion:^(BOOL finished) {
        if (i<7) {
            i++;
            [self textImgAnimation];
        } else {
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startDismissAnimation:)];
            [self.welcomeView addGestureRecognizer:gesture];
            self.welcomeView.userInteractionEnabled = YES;
            
        }
    }];
    
}

//页面消失动画
-(void)startDismissAnimation:(UITapGestureRecognizer *)gesture{
    //水波纹动画
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.type = @"rippleEffect";
    [animation setDuration:1];
    animation.removedOnCompletion = NO;
    [self.welcomeView.layer addAnimation:animation forKey:nil];
    [UIView animateWithDuration:3 animations:^{
        self.welcomeView.alpha = 0;
    } completion:^(BOOL finished) {
        NSFrameworkManager *frameworkManager = [NSFrameworkManager sharedInstance];
        [frameworkManager toMainFramework];
    }];
}

@end
