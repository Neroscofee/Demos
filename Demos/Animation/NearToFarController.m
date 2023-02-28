//
//  NearToFarController.m
//  Demos
//
//  Created by Neroscofee on 2023/2/28.
//  Copyright © 2023 Neroscofee. All rights reserved.
//

#import "NearToFarController.h"

@interface NearToFarController ()<UIScrollViewDelegate>

{
    CGFloat h;
}

@property (nonatomic, strong) UIScrollView *topscrollView;
@property (nonatomic, strong) UIScrollView *midscrollView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation NearToFarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    h = 766*SCREEN_WIDTH/700;
    
    [self.view addSubview:self.topscrollView];
    [self.view addSubview:self.midscrollView];
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self;
    
    CGFloat m = 0.7*0.7;
    UIImageView *topIV1 = [[UIImageView alloc] initWithFrame:CGRectMake((1-m)/2*SCREEN_WIDTH, 0, SCREEN_WIDTH*m, h*m)];
    topIV1.image = UIImageMake(@"GLASS-7.png");
    [self.topscrollView addSubview:topIV1];
    UIImageView *topIV2 = [[UIImageView alloc] initWithFrame:CGRectMake((1-m)/2*SCREEN_WIDTH, h*m, SCREEN_WIDTH*m, h*m)];
    topIV2.image = UIImageMake(@"GLASS-8.png");
    [self.topscrollView addSubview:topIV2];
    for (int i=0; i<7; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((1-m)/2*SCREEN_WIDTH, (i+2)*h*m, SCREEN_WIDTH*m, h*m)];
        NSString *picName = [NSString stringWithFormat:@"GLASS-%d.png",i];
        imageView.image = UIImageMake(picName);
        [self.topscrollView addSubview:imageView];
    }

    CGFloat n = 0.7;
    UIImageView *midIV = [[UIImageView alloc] initWithFrame:CGRectMake((1-n)/2*SCREEN_WIDTH, 0, SCREEN_WIDTH*n, h*n)];
    midIV.image = UIImageMake(@"GLASS-8.png");
    [self.midscrollView addSubview:midIV];
    for (int i=0; i<8; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((1-n)/2*SCREEN_WIDTH, (i+1)*h*n, SCREEN_WIDTH*n, h*n)];
        NSString *picName = [NSString stringWithFormat:@"GLASS-%d.png",i];
        imageView.image = UIImageMake(picName);
        [self.midscrollView addSubview:imageView];
    }
    
    for (int i=0; i<9; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, i*h, SCREEN_WIDTH, h)];
        NSString *picName = [NSString stringWithFormat:@"GLASS-%d.png",i];
        imageView.image = UIImageMake(picName);
        imageView.tag = 2345 + i;
        [self.scrollView addSubview:imageView];
    }
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 766*SCREEN_WIDTH/700)];
//    imageView.image = UIImageMake(@"GLASS-0.png");
//    [self.scrollView addSubview:imageView];
    
   
    
    // Do any additional setup after loading the view.
}

- (UIScrollView *)topscrollView {
    if (!_topscrollView) {
        _topscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, h)];
        _topscrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 9*h);
        _topscrollView.backgroundColor = [UIColor whiteColor];
        _topscrollView.showsVerticalScrollIndicator = NO;
        _topscrollView.pagingEnabled = YES;
    }
    return _topscrollView;
}

- (UIScrollView *)midscrollView {
    if (!_midscrollView) {
        _midscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, h)];
        _midscrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 9*h);
        _midscrollView.backgroundColor = [UIColor whiteColor];
        _midscrollView.showsVerticalScrollIndicator = NO;
        _midscrollView.pagingEnabled = YES;
    }
    return _midscrollView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, h)];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 9*h);
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
//        _scrollView.bounces = NO;
        
        _scrollView.minimumZoomScale = 0.3;
        _scrollView.maximumZoomScale = 1;
    }
    return _scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y == h) {
        UIView *view = [scrollView viewWithTag:2345];
//        view.frame.size.width = SCREEN_WIDTH*0.7;
//        view.frame.size.height = h*0.7;
        view.frame = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, SCREEN_WIDTH*0.7, h*0.7);
    }
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"缩放开始");
//    UIView *view = [scrollView viewWithTag:2345];
    return scrollView.subviews[1];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
//    [self.view bringSubviewToFront:scaleRatioLabel];
//    [scaleRatioLabel setAlpha:0.6f];
//    [scaleRatioLabel setBackgroundColor:[UIColor lightGrayColor]];
//    scaleRatioLabel.text = [NSString stringWithFormat:@" x%.1f",scale];
//
//    [UIView transitionWithView:scaleRatioLabel duration:2.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        scaleRatioLabel.alpha = 0.0f;
//    } completion:nil];
    
    NSLog(@"缩放结束");
    NSLog(@"%f",scale);
    scale = 1;
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
