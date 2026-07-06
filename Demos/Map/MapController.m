//
//  MapController.m
//  Demos
//
//  Created by Neroscofee on 2026/7/6.
//  Copyright © 2026 Neroscofee. All rights reserved.
//

#import "MapController.h"

NS_ASSUME_NONNULL_BEGIN

@implementation MapController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.mapView];
    //设置约束使其填满父视图的安全区域
    [NSLayoutConstraint activateConstraints:@[
        [self.mapView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.mapView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [self.mapView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [self.mapView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
    
    self.mapView.delegate = self;
    //初始化
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self checkLocationAuthorization];

}

- (void)swipeAction:(UISwipeGestureRecognizer *)gr {
    if (gr.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"右滑返回");
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)checkLocationAuthorization {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];

    switch (status) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            self.mapView.showsUserLocation = YES;
            // 开始监听位置变化
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            [self.locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"定位权限被拒绝");
            break;
        case kCLAuthorizationStatusNotDetermined:
            // 请求 "使用期间" 的定位权限
            [self.locationManager requestWhenInUseAuthorization];
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"定位服务受限");
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            self.mapView.showsUserLocation = YES;
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            [self.locationManager startUpdatingLocation];
            break;
        default:
            NSLog(@"未知的授权状态");
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.lastObject;
    if (!location) {
        return;
    }
    
    //移除旧的圆,如果存在
    if (self.locationCircle) {
        [self.mapView removeOverlay:self.locationCircle];
    }
    
    //创建 MKCircle 对象
    CLLocationCoordinate2D circleCenter = location.coordinate;
    CLLocationDistance radius = 500;
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:circleCenter radius:radius];
    self.locationCircle = circle;
    
    //将圆添加到地图上
    [self.mapView addOverlay:circle];
    
    //移动地图视图以适应圆的范围
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(circleCenter, radius*2.0, radius*2.0);
    [self.mapView setRegion:region animated:NO];
    
    NSLog(@"Location Coord: (%f, %f)", location.coordinate.latitude, location.coordinate.longitude);
    NSLog(@"Circle Center: (%f, %f)", circleCenter.latitude, circleCenter.longitude);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"定位失败: %@", error.localizedDescription);
}

//实现 rendererForOverlay 方法来定义如何绘制覆盖层
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    //检查是否是 MKCircle 并设置渲染器样式
    if ([overlay isKindOfClass:[MKCircle class]]) {
        MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
        circleRenderer.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.3];
        circleRenderer.strokeColor = [UIColor cyanColor];
        circleRenderer.lineWidth = 1.0;
        return circleRenderer;
    }
    // 如果有其他类型的覆盖层，需要在这里处理
    // 返回默认渲染器
    return nil; // 或者 [[MKOverlayRenderer alloc] initWithOverlay:overlay];
}
@end

NS_ASSUME_NONNULL_END
