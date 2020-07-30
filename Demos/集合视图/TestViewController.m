//
//  TestViewController.m
//  Demos
//
//  Created by Neroscofee on 2016/12/27.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "TestViewController.h"
#import "UIColor+RandomColor.h"
#import "UIButton+BackgroundColor.h"
#import "TriangleView.h"
#import "Square.h"
#import "DownloadIndicator.h"
#import <objc/runtime.h>


#define SCREENWIDTH self.view.bounds.size.width
#define SCREENHEIGHT self.view.bounds.size.height

@interface TestViewController ()<UIScrollViewDelegate>
{
    Square *sq;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) DownloadIndicator *indicator;

@end

@implementation TestViewController
static NSString *const cellID = @"pCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(47, 60);
    layout.minimumInteritemSpacing = 25;
    layout.minimumLineSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 25);
    
    UICollectionView *coView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    coView.delegate = self;
    coView.dataSource = self;
    coView.backgroundColor = [UIColor whiteColor];
    [coView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:coView];
    self.title = @"滚动视图";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    TriangleView *triangle = [[TriangleView alloc] initWithFrame:CGRectMake(100, 200, 70, 70)];
//    triangle.backgroundColor = [UIColor whiteColor];
////    [self.view addSubview:triangle];
//
//    sq = [[Square alloc] initWithFrame:self.view.bounds];
//    sq.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:sq];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(40, 64, 60, 44);
////    [button setTitle:@"GO" forState:UIControlStateNormal];
////    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//    button.backgroundColor = [UIColor blueColor];
//    [button setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//    [button addTarget:self action:@selector(changeButtonColor) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:button];
//
//    UISlider *sd = [[UISlider alloc] initWithFrame:CGRectMake(70, 250, self.view.bounds.size.width-140, 60)];
//    self.slider = sd;
//    [self.slider addTarget:self action:@selector(sliderChangeValue:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:self.slider];
//
//    self.indicator = [[DownloadIndicator alloc] initWithFrame:CGRectMake(100, 360, 170, 110)];
//    self.indicator.backgroundColor = [UIColor whiteColor];
////    self.indicator.lineWidth = 30;
//    self.indicator.lineColor = [UIColor redColor];
//    [self.view addSubview:self.indicator];
//
//
////    [self.view addSubview:self.scrollView];
////    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(scrollViewRecycle) userInfo:nil repeats:YES];
//    //
//    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 450, 60, 44)];
//    [sw addTarget:self action:@selector(swSlider) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:sw];

    
    // Do any additional setup after loading the view.
//    NSString *method = @"UIButton";
//    id myObj = [[NSClassFromString(method) alloc] init];
    

}

- (void)swSlider {
    NSLog(@"被打开");
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0f) {
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone == setting.types) {
            NSLog(@"推送关闭");
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge)   categories:nil]];
            
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        } else {
            NSLog(@"推送打开");
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge)   categories:nil]];
            
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        }
    }
}

- (void)sliderChangeValue:(UISlider *)slider {
    self.indicator.value = slider.value;
}

- (void)changeButtonColor {
    NSLog(@"111");
    [sq changeColor];
}

- (void)dealloc {
    [self.timer invalidate];
}

- (void)scrollViewRecycle {
    CGPoint p = self.scrollView.contentOffset;
    static BOOL isEnd = YES;
    if (isEnd) {
        p.x = p.x + SCREENWIDTH;
    } else {
        p.x = p.x - SCREENWIDTH;
    }
    self.scrollView.contentOffset = p;
    if (p.x == SCREENWIDTH*2) {
        isEnd = NO;
        p.x = p.x - SCREENWIDTH;
    } else if (p.x == 0) {
        isEnd = YES;
        p.x = p.x + SCREENWIDTH;
    }
    
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake(SCREENWIDTH*3, SCREENHEIGHT);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        view1.backgroundColor = [UIColor redColor];
        [_scrollView addSubview:view1];
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT)];
        view2.backgroundColor = [UIColor greenColor];
        [_scrollView addSubview:view2];
        
        UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH*2, 0, SCREENWIDTH, SCREENHEIGHT)];
        view3.backgroundColor = [UIColor blueColor];
        [_scrollView addSubview:view3];
        
        
    }
    return _scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",self.scrollView.contentOffset.x);
    
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
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
