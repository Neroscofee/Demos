//
//  NSCatViewController.m
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import "NSCatViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface NSCatViewController ()

@property (nonatomic, strong) UIImageView *catImgageView;
@property (nonatomic, strong) UIButton *showButton;
@property (nonatomic, strong) UIView *transparentView;

@end

@implementation NSCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.transparentView];
    [self.transparentView addSubview:self.catImgageView];
//    [self.view addSubview:self.showButton];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(giveCat:)];
    [self.transparentView addGestureRecognizer:tap];
    
//    [self.showButton addTarget:self action:@selector(giveCat:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (UIView *)transparentView {
    if (!_transparentView) {
        _transparentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_NavigationBar_Height-Fit_Tabbar_Height-Fit_Bottom_Safe_Height)];
        _transparentView.backgroundColor = [UIColor clearColor];
        _transparentView.userInteractionEnabled = YES;
    }
    return _transparentView;
}

- (UIImageView *)catImgageView {
    if (!_catImgageView) {
        _catImgageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-40, 400)];
//        _catImgageView.layer.cornerRadius = 10;
        _catImgageView.layer.borderWidth = 1;
        _catImgageView.layer.borderColor = [UIColor blackColor].CGColor;
        _catImgageView.clipsToBounds = YES;
    }
    return _catImgageView;
}

- (UIButton *)showButton {
    if (!_showButton) {
        _showButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _showButton.backgroundColor = UIColorMake(0xFF6F61);
        _showButton.frame = CGRectMake((SCREEN_WIDTH-100)/2, 20, 100, 44);
        _showButton.layer.cornerRadius = 10;
        [_showButton setTitle:@"show me!" forState:UIControlStateNormal];
    }
    return _showButton;
}

- (void)giveCat:(UIButton *)sender {
    NSLog(@"给我一只猫");
//    self.catImgageView
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
//        NSString *path = @"http://img02.tuke88.com/newpreview_music/09/00/24/5c890f3ea73ad22662.mp3";
//        NSURL *url = [NSURL URLWithString:path];
//        AVPlayerItem *songItem = [[AVPlayerItem alloc] initWithURL:url];
//        AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:songItem];
//        [player play];
//        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//        [audioPlayer play];
//        SystemSoundID soundID = 717;
//        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundI2rxD);
//        AudioServicesPlayAlertSound(soundID);
        NSInteger a = arc4random()%4+1;
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"catsound%ld",(long)a] ofType:@"mp3"];
        NSURL *url = [NSURL URLWithString:path];
        SystemSoundID soundID = 717;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
        AudioServicesPlaySystemSound(soundID);
        
    });
    NSInteger picWidth = arc4random()%175+200;
    NSInteger picHeight = arc4random()%300+200;
    NSString *urlString = [NSString stringWithFormat:@"http://placekitten.com/%ld/%ld",(long)picWidth,(long)picHeight];
    self.catImgageView.frame = CGRectMake((SCREEN_WIDTH-picWidth)/2, 100, picWidth, picHeight);
    [self.catImgageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:UIImageMake(@"placeholder.png")];
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
