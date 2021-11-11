//
//  PNChartViewController.h
//  Demos
//
//  Created by Neroscofee on 2017/2/7.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"

@interface PNChartViewController : UIViewController<PNChartDelegate>

@property (nonatomic) PNLineChart *lineChart;
@property (nonatomic) PNBarChart *barChart;
@property (nonatomic) PNCircleChart *circleChart;
@property (nonatomic) PNPieChart *pieChart;
@property (nonatomic) PNScatterChart *scatterChart;
@property (nonatomic) PNRadarChart *radarChart;

@property (nonatomic, strong) UIButton *convertButton;



@end
