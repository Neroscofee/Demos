//
//  FireViewController.m
//  Demos
//
//  Created by Neroscofee on 2017/9/5.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "FireViewController.h"
#import "FireButton.h"
#import <QuartzCore/CoreAnimation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface FireViewController ()
{
    CAEmitterLayer *fireEmitter;
}
@property (nonatomic, strong) NSTimer *timer;

@end

static NSInteger count = 100;
@implementation FireViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"💓";
    FireButton *button = [FireButton buttonWithType:UIButtonTypeCustom];
    button.tag = 10000;
    button.backgroundColor = [UIColor orangeColor];
    button.frame = CGRectMake(0, 0, 40, 40);
    button.center = CGPointMake(SCREEN_WIDTH/2, 100);
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(Start:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];

}

- (void)Start:(UIButton *)button {
    if (button.tag%2 == 0) {
        [button setTitle:@"Stop" forState:UIControlStateNormal];
        button.tag--;
        if (!self.timer) {
            [self firework:nil];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(firework:) userInfo:nil repeats:YES];
        }
        [self fire:nil];
    } else {
        [button setTitle:@"Start" forState:UIControlStateNormal];
        button.tag++;
        [fireEmitter removeFromSuperlayer];
        if (self.timer.isValid) {
            [self.timer invalidate];
            self.timer = nil;
        }
    }
}

- (void)firework:(NSTimer *)timer {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"firework" ofType:@"wav"];
//    NSURL *url = [NSURL URLWithString:path];
//    SystemSoundID soundID = 777;
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
//    AudioServicesPlayAlertSound(soundID);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"firework" ofType:@"wav"];
        NSURL *url = [NSURL URLWithString:path];
        SystemSoundID soundID = 777;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
        AudioServicesPlayAlertSound(soundID);
    });
    
//    AudioServicesPlaySystemSound(soundID);
}

- (void)fire:(NSTimer *)timer {
    fireEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2, viewBounds.size.height-60);
    fireEmitter.emitterSize = CGSizeMake(viewBounds.size.width/2, 0);
    fireEmitter.emitterMode = kCAEmitterLayerOutline;
    fireEmitter.emitterShape = kCAEmitterLayerLine;
    fireEmitter.renderMode = kCAEmitterLayerAdditive;
    fireEmitter.seed = arc4random()%3+1;
    
    CAEmitterCell *rocket = [CAEmitterCell emitterCell];
    rocket.birthRate = 1;
    rocket.emissionRange = M_PI_4;
    rocket.velocity = 380;
    rocket.velocityRange = 100;
    rocket.yAcceleration = 80;
    rocket.lifetime = 1.05;
    rocket.contents = (id)[UIImage imageNamed:@"DazRing.png"].CGImage;
    rocket.scale = 0.2;
    rocket.color = [UIColor redColor].CGColor;
    rocket.greenRange = 1;
    rocket.redRange = 1;
    rocket.blueRange = 1;
    rocket.spinRange = M_PI;
    
    CAEmitterCell *burst = [CAEmitterCell emitterCell];
    burst.birthRate = 1;
    burst.velocity = 0;
    burst.scale = 3;
    burst.redSpeed = -1.5;
    burst.blueRange = 1.5;
    burst.greenRange = 1;
    burst.lifetime = 0.5;
    
    fireEmitter.emitterCells = [NSArray arrayWithObject:rocket];
    rocket.emitterCells = [NSArray arrayWithObject:burst];
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 4; i++) {
        CAEmitterCell *spark = [CAEmitterCell emitterCell];
        spark.birthRate = 133;
        spark.velocity = 130;
        spark.emissionRange = M_PI * 2;
        spark.yAcceleration = 80;
        
        spark.lifetime = 3;
        //粒子大小 pi
        spark.contentsScale = 0.66;
        //int value = arc4random()%4+1;
        switch (i) {
            case 0:
                spark.contents = (id)[UIImage imageNamed:@"DazHeart.png"].CGImage;
                break;
            case 1:
                spark.contents = (id)[UIImage imageNamed:@"DazHeart.png"].CGImage;
                break;
            case 2:
                spark.contents = (id)[UIImage imageNamed:@"DazHeart.png"].CGImage;
                break;
            case 3:
                spark.contents = (id)[UIImage imageNamed:@"DazHeart.png"].CGImage;
                break;
                
            default:
                break;
        }
        //spark.contents = (id)[UIImage imageNamed:@"wei.png"].CGImage;
        spark.scaleSpeed = -0.2;
        spark.greenSpeed = -0.1;
        spark.redSpeed = 0.4;
        spark.blueRange = -0.1;
        spark.alphaSpeed = -0.25;
        spark.spin = 2*M_PI;
        spark.spinRange = 2*M_PI;
        [arr addObject:spark];
    }
    
    
    burst.emitterCells = [NSArray arrayWithArray:arr];
    
    
    //burst.emitterCells = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireEmitter];
    
    if (count == 200) {
        [timer invalidate];
        [fireEmitter removeFromSuperlayer];
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
