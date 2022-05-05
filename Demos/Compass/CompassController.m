//
//  CompassController.m
//  Demos
//
//  Created by Neroscofee on 2022/5/5.
//  Copyright © 2022 Neroscofee. All rights reserved.
//

#import "CompassController.h"
#import <CoreLocation/CoreLocation.h>

@interface CompassController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) UIImageView *compassIV;
@property (nonatomic, strong) UILabel *longitudeLabel;
@property (nonatomic, strong) UILabel *latitudeLabel;
@property (nonatomic, strong) UILabel *altitudeLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end

@implementation CompassController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.compassIV];
    [self.view addSubview:self.longitudeLabel];
    [self.view addSubview:self.latitudeLabel];
    [self.view addSubview:self.altitudeLabel];
    [self.view addSubview:self.addressLabel];
//    [self getLocationString:25.066646];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 5.0;
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    CGFloat angle = newHeading.magneticHeading * M_PI / 180;
    self.compassIV.transform = CGAffineTransformMakeRotation(-angle);
}

- (NSString *)getLocationString:(double)value {
    // 25.066646
    double du = floor(value);
    double min = value-du;
    min = floor(min*60);
    double sec = ((value-du)*60-min)*60;
    NSString *string = [NSString stringWithFormat:@"%.f°%.f′%.4f″",du,min,sec];
    return string;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *newLocation = [locations lastObject];

    NSLog(@"纬度:%f----经度:%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
//    NSInteger du = newLocation.coordinate.latitude;
//    CGFloat min = newLocation.coordinate.latitude
    
//    self.latitudeLabel.text = [NSString stringWithFormat:@"当前纬度: %.6f",newLocation.coordinate.latitude];
//    self.longitudeLabel.text = [NSString stringWithFormat:@"当前经度: %.6f",newLocation.coordinate.longitude];
    self.altitudeLabel.text = [NSString stringWithFormat:@"当前高度: %.2f米",newLocation.altitude];
    
    self.latitudeLabel.text = [NSString stringWithFormat:@"当前纬度: %@",[self getLocationString:newLocation.coordinate.latitude]];
    self.longitudeLabel.text = [NSString stringWithFormat:@"当前经度: %@",[self getLocationString:newLocation.coordinate.longitude]];
    //
    
    //根据经纬度反编译地址信息
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {

        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            NSLog(@"当前用户所在城市：%@",placeMark.locality);
            NSLog(@"%@",placeMark.country);//当前国家
            NSLog(@"%@",placeMark.locality);//当前城市
            NSLog(@"%@",placeMark.subLocality);//当前位置
            NSLog(@"%@",placeMark.thoroughfare);//当前街道
            NSLog(@"%@",placeMark.name);//具体地址  市  区  街道

            NSString *address = [NSString stringWithFormat:@"%@%@%@",placeMark.locality,placeMark.subLocality,placeMark.name];
            NSLog(@"%@",address);
//            self.addressLabel.text = [NSString stringWithFormat:@"11111111111111111111111%@",address];
            self.addressLabel.text = address;
        } else if (error == nil && placemarks.count == 0) {
            NSLog(@"没有地址返回");
        } else if (error) {
            NSLog(@"%@",error);
        }
    }];
    
    [manager stopUpdatingLocation];
}

- (UIImageView *)compassIV {
    if (!_compassIV) {
        _compassIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.8, SCREEN_WIDTH*0.8)];
        _compassIV.center = CGPointMake(self.view.center.x, SCREEN_HEIGHT/2 - Fit_NavigationBar_Height);
        _compassIV.image = UIImageMake(@"compassIM.png");
    }
    return _compassIV;
}

- (UILabel *)latitudeLabel {
    if (!_latitudeLabel) {
        _latitudeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(self.compassIV.frame)+20, SCREEN_WIDTH-100, 20)];
        _latitudeLabel.font = UIFontMake(18);
        _latitudeLabel.text = @"";
        _latitudeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _latitudeLabel;
}

- (UILabel *)longitudeLabel {
    if (!_longitudeLabel) {
        _longitudeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(self.latitudeLabel.frame)+20, SCREEN_WIDTH-100, 20)];
        _longitudeLabel.font = UIFontMake(18);
        _longitudeLabel.text = @"";
        _longitudeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _longitudeLabel;
}

- (UILabel *)altitudeLabel {
    if (!_altitudeLabel) {
        _altitudeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(self.longitudeLabel.frame)+20, SCREEN_WIDTH-100, 20)];
        _altitudeLabel.font = UIFontMake(18);
        _altitudeLabel.text = @"";
        _altitudeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _altitudeLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(self.altitudeLabel.frame)+20, SCREEN_WIDTH-100, 60)];
        _addressLabel.numberOfLines = 3;
        _addressLabel.font = UIFontMake(18);
        _addressLabel.text = @"";
        _addressLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _addressLabel;
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
