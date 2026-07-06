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
    
    //添加点击手势识别器，让用户可以选择位置并添加标注
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.mapView addGestureRecognizer:tap];
    
    //添加长按手势识别器，在标注上长按弹出输入框
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 0.5; // 长按0.5秒触发
    [self.mapView addGestureRecognizer:longPress];
    
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
            // 开始监听位置变化，只用于显示用户位置
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

// 处理点击手势，添加或移动标注
- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    // 获取点击点在地图上的坐标
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    // 如果已经有标注，移除旧标注
    if (self.selectedAnnotation) {
        [self.mapView removeAnnotation:self.selectedAnnotation];
    }
    
    // 创建新标注
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = coordinate;
    annotation.title = @"选择的位置";
    annotation.subtitle = @"长按0.5秒设置半径";
    
    self.selectedAnnotation = annotation;
    [self.mapView addAnnotation:annotation];
    
    NSLog(@"标注添加在: (%f, %f)", coordinate.latitude, coordinate.longitude);
}

// 处理长按手势，在标注位置弹出输入框
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        // 获取长按点在地图上的坐标
        CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        
        // 检查长按位置是否在标注附近
        if (self.selectedAnnotation) {
            CLLocation *touchLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
            CLLocation *annotationLocation = [[CLLocation alloc] initWithLatitude:self.selectedAnnotation.coordinate.latitude longitude:self.selectedAnnotation.coordinate.longitude];
            
            // 计算距离，如果在50米范围内认为是在标注上长按
            CLLocationDistance distance = [touchLocation distanceFromLocation:annotationLocation];
            if (distance < 50) {
                [self showRadiusInputAlert];
            }
        }
    }
}

// 显示输入半径的弹框
- (void)showRadiusInputAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"设置圆形半径"
                                                                   message:@"请输入半径（单位：米）"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    // 添加文本输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"例如: 500";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    // 确定按钮
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = alert.textFields.firstObject;
        NSString *radiusText = textField.text;
        
        if (radiusText.length > 0) {
            CLLocationDistance radius = [radiusText doubleValue];
            if (radius > 0 && radius <= 100000) { // 限制最大半径为100km
                [self createCircleWithRadius:radius];
            } else {
                [self showErrorAlert:@"请输入有效的半径（1-100000米）"];
            }
        } else {
            [self showErrorAlert:@"请输入半径数值"];
        }
    }];
    
    // 取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:confirmAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

// 显示错误提示
- (void)showErrorAlert:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"输入错误"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

// 在标注位置创建指定半径的圆圈
- (void)createCircleWithRadius:(CLLocationDistance)radius {
    if (!self.selectedAnnotation) {
        return;
    }
    
    CLLocationCoordinate2D coordinate = self.selectedAnnotation.coordinate;
    
    //移除旧的圆,如果存在
    if (self.locationCircle) {
        [self.mapView removeOverlay:self.locationCircle];
    }
    
    //创建 MKCircle 对象
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:coordinate radius:radius];
    self.locationCircle = circle;
    
    //将圆添加到地图上
    [self.mapView addOverlay:circle];
    
    //移动地图视图以圆心为中心，显示圆的范围
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, radius*2.5, radius*2.5);
    // 使用 regionThatFits 方法确保区域适合地图视图，避免偏移
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    // 确保圆心位置准确，重新设置中心点
    [self.mapView setCenterCoordinate:coordinate animated:YES];
    
    // 更新标注的副标题
    self.selectedAnnotation.subtitle = [NSString stringWithFormat:@"半径: %.0f米", radius];
    
    NSLog(@"圆形创建在: (%f, %f)，半径: %.0f米", coordinate.latitude, coordinate.longitude, radius);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.lastObject;
    if (!location) {
        return;
    }
    
    // 只更新用户位置显示，不自动创建圆圈
    // 用户需要长按地图来手动指定圆心位置
    NSLog(@"User Location Updated: (%f, %f)", location.coordinate.latitude, location.coordinate.longitude);
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
