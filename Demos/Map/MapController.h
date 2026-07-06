//
//  MapController.h
//  Demos
//
//  Created by Neroscofee on 2026/7/6.
//  Copyright © 2026 Neroscofee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) MKCircle *locationCircle;
@property (nonatomic, strong) MKPointAnnotation *selectedAnnotation; // 用户选择的标注点

@end

NS_ASSUME_NONNULL_END
