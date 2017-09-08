//
//  PNChartViewController.m
//  Demo9_6
//
//  Created by 石飞龙 on 2017/2/7.
//  Copyright © 2017年 石飞龙. All rights reserved.
//

#import "PNChartViewController.h"

#define ARC4RANDOM_MAX 0x100000000
@interface PNChartViewController ()

@end

@implementation PNChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PNLineChart";
    self.view.backgroundColor = [UIColor orangeColor];
    
    
//    [self createLineChart];
    
    [self makeDemoLineChart];
//    [self zzChart];
//    [self bzChart];
//    [self circleIndicator];
//    [self barDemoChart];
//    [self scatterDemoChart];
    
    //
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.convertButton = button;
    self.convertButton.backgroundColor = [UIColor blueColor];
    self.convertButton.frame = CGRectMake(50, 420, 70, 30);
    self.convertButton.layer.cornerRadius = 3;
    [self.convertButton setTitle:@"重绘" forState:UIControlStateNormal];
    [self.convertButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.convertButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.convertButton addTarget:self action:@selector(transitChart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.convertButton];
}

- (void)transitChart {
    NSLog(@"11111111111111111111");
    [self.lineChart strokeChart];
}

- (void)makeDemoLineChart {
    self.lineChart.backgroundColor = [UIColor whiteColor];
    self.lineChart.yGridLinesColor = [UIColor redColor];
    [self.lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.pointLabelColor = [UIColor blackColor];
    }];
    
    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    self.lineChart.showCoordinateAxis = YES;//是否显示坐标轴
    self.lineChart.yLabelFormat = @"%1.1f";
    self.lineChart.xLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:8.0];
    [self.lineChart setXLabels:@[@"SEP 1", @"SEP 2", @"SEP 3", @"SEP 4", @"SEP 5", @"SEP 6", @"SEP 7"]];
    //
    self.lineChart.yLabelColor = [UIColor blackColor];
    self.lineChart.xLabelColor = [UIColor redColor];
    
    self.lineChart.showGenYLabels = NO;
    self.lineChart.showYGridLines = YES;
    
    self.lineChart.yFixedValueMax = 300.0;
    self.lineChart.yFixedValueMin = 0;
    
    [self.lineChart setYLabels:@[
                                 @"0 min",
                                 @"50 min",
                                 @"100 min",
                                 @"150 min",
                                 @"200 min",
                                 @"250 min",
                                 @"300 min",
                                 ]
     ];
    //
    NSArray *data01Array = @[@15.1, @60.1, @110.4, @10.0, @186.2, @197.2, @276.2];
//    data01Array = [[data01Array reverseObjectEnumerator] allObjects];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.rangeColors = @[
                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(10, 30) color:[UIColor redColor]],
                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(100, 200) color:[UIColor purpleColor]]
                           ];
    data01.dataTitle = @"每天行走时间";
    data01.color = PNFreshGreen;
    data01.pointLabelColor = [UIColor orangeColor];
    data01.alpha = 0.9f;
    data01.showPointLabel = YES;
    data01.pointLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:9.0];
    data01.itemCount = data01Array.count;
    data01.inflexionPointColor = PNBlue;
    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    NSArray *data02Array = @[@0.0, @180.7, @26.4, @202.2, @126.2, @167.2, @276.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"下降趋势";
    
    
    
    self.lineChart.chartData = @[data01];
    [self.lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.pointLabelColor = [UIColor redColor];
    }];
    
    [self.lineChart strokeChart];
    self.lineChart.delegate = self;
    [self.view addSubview:self.lineChart];
    
    self.lineChart.legendStyle = PNLegendItemStyleSerial;
    self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    self.lineChart.legendFontColor = [UIColor redColor];
    
    UIView *legend = [self.lineChart getLegendWithMaxWidth:320];
    [legend setFrame:CGRectMake(30, 340, legend.frame.size.width, legend.frame.size.width)];
    [self.view addSubview:legend];

    
}

- (void)createLineChart {
    PNLineChart * lineChart = [[PNLineChart alloc]initWithFrame:CGRectMake(0,135.0,SCREEN_WIDTH,200.0)];
    lineChart.showCoordinateAxis = YES;
    //X轴数据
    [lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    
    //Y轴数据
    NSArray * data01Array =@[@60.1,@160.1,@126.4,@262.2,@186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    //可以添加多条折线
    NSArray * data02Array =@[@20.1,@180.1,@26.4,@202.2,@126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    lineChart.chartData = @[data01, data02];
    [lineChart strokeChart];
    //加载在视图上
    [self.view addSubview:lineChart];
}

- (void)zzChart {
    PNBarChart * barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0,135.0,SCREEN_WIDTH,200.0)];
    //X轴数据
    [barChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    //Y轴数据
    [barChart setYValues:@[@1, @10,@2,@6,@3]];
    [barChart strokeChart];
    
    //加载在视图上
    [self.view addSubview:barChart];
}

- (void)bzChart {
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"GOOG I/O"],
                       ];
    PNPieChart *pieChart = [[PNPieChart alloc]initWithFrame:CGRectMake(40.0,155.0,240.0,240.0) items:items];
    //饼状图文字颜色
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium"size:14.0];
    //绘制
    [pieChart strokeChart];
    
    //加载在视图上
    [self.view addSubview:pieChart];
}

- (void)circleIndicator {
    // total参数是进度条的总数据量，current是当前的数据量，closewise是绘制方向，YES是从左到右，NO为从右到左
    PNCircleChart *circleChart = [[PNCircleChart alloc]initWithFrame:CGRectMake(40.0,155.0,240.0,240.0) total:@100 current:@60 clockwise:YES];
    
    //绘制图形
    [circleChart strokeChart];
    
    [circleChart setStrokeColor:[UIColor clearColor]];
    [circleChart setStrokeColorGradientStart:[UIColor blueColor]];
    
    //加载在视图上
    [self.view addSubview:circleChart];
}

- (void)barDemoChart {
    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter) {
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }
    
    self.barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    //        self.barChart.showLabel = NO;
    self.barChart.yLabelFormatter = ^(CGFloat yValue) {
        return [barChartFormatter stringFromNumber:@(yValue)];
    };
    
    self.barChart.yChartLabelWidth = 20.0;
    self.barChart.chartMarginLeft = 30.0;
    self.barChart.chartMarginRight = 10.0;
    self.barChart.chartMarginTop = 5.0;
    self.barChart.chartMarginBottom = 10.0;
    
    
    self.barChart.labelMarginTop = 5.0;
    self.barChart.showChartBorder = YES;
    [self.barChart setXLabels:@[@"2", @"3", @"4", @"5", @"2", @"3", @"4", @"5"]];
    //       self.barChart.yLabels = @[@-10,@0,@10];
    //        [self.barChart setYValues:@[@10000.0,@30000.0,@10000.0,@100000.0,@500000.0,@1000000.0,@1150000.0,@2150000.0]];
    [self.barChart setYValues:@[@10.82, @1.88, @6.96, @33.93, @10.82, @1.88, @6.96, @33.93]];
    [self.barChart setStrokeColors:@[PNGreen, PNGreen, PNRed, PNGreen, PNGreen, PNGreen, PNRed, PNGreen]];
    self.barChart.isGradientShow = NO;
    self.barChart.isShowNumbers = NO;
    
    [self.barChart strokeChart];
    
    self.barChart.delegate = self;
    
    [self.view addSubview:self.barChart];
}

- (void)scatterDemoChart {
    self.scatterChart = [[PNScatterChart alloc] initWithFrame:CGRectMake((CGFloat) (SCREEN_WIDTH / 6.0 - 30), 135, 280, 200)];
    //        self.scatterChart.yLabelFormat = @"xxx %1.1f";
    [self.scatterChart setAxisXWithMinimumValue:20 andMaxValue:100 toTicks:6];
    [self.scatterChart setAxisYWithMinimumValue:30 andMaxValue:50 toTicks:5];
    [self.scatterChart setAxisXLabel:@[@"x1", @"x2", @"x3", @"x4", @"x5", @"x6"]];
    [self.scatterChart setAxisYLabel:@[@"y1", @"y2", @"y3", @"y4", @"y5"]];
    
    NSArray *data01Array = [self randomSetOfObjects];
    PNScatterChartData *data01 = [PNScatterChartData new];
    data01.strokeColor = PNGreen;
    data01.fillColor = PNFreshGreen;
    data01.size = 2;
    data01.itemCount = [data01Array[0] count];
    data01.inflexionPointStyle = PNScatterChartPointStyleCircle;
    __block NSMutableArray *XAr1 = [NSMutableArray arrayWithArray:data01Array[0]];
    __block NSMutableArray *YAr1 = [NSMutableArray arrayWithArray:data01Array[1]];
    
    data01.getData = ^(NSUInteger index) {
        CGFloat xValue;
        xValue = [XAr1[index] floatValue];
        CGFloat yValue = [YAr1[index] floatValue];
        return [PNScatterChartDataItem dataItemWithX:xValue AndWithY:yValue];
    };
    
    [self.scatterChart setup];
    self.scatterChart.chartData = @[data01];
    /***
     this is for drawing line to compare
     CGPoint start = CGPointMake(20, 35);
     CGPoint end = CGPointMake(80, 45);
     [self.scatterChart drawLineFromPoint:start ToPoint:end WithLineWith:2 AndWithColor:PNBlack];
     ***/
    CGPoint start = CGPointMake(20, 35);
    CGPoint end = CGPointMake(80, 45);
    [self.scatterChart drawLineFromPoint:start ToPoint:end WithLineWith:2 AndWithColor:PNBlack];
    
    self.scatterChart.delegate = self;
    [self.view addSubview:self.scatterChart];
    
}

- (NSArray *)randomSetOfObjects {
    NSMutableArray *array = [NSMutableArray array];
    NSString *LabelFormat = @"%1.f";
    NSMutableArray *XAr = [NSMutableArray array];
    NSMutableArray *YAr = [NSMutableArray array];
    for (int i = 0; i < 25; i++) {
        [XAr addObject:[NSString stringWithFormat:LabelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisX_maxValue - self.scatterChart.AxisX_minValue) + self.scatterChart.AxisX_minValue)]];
        [YAr addObject:[NSString stringWithFormat:LabelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisY_maxValue - self.scatterChart.AxisY_minValue) + self.scatterChart.AxisY_minValue)]];
    }
    [array addObject:XAr];
    [array addObject:YAr];
    return array;
}

- (void)radarDemoChart {
    NSArray *items = @[[PNRadarChartDataItem dataItemWithValue:3 description:@"Art"],
                       [PNRadarChartDataItem dataItemWithValue:2 description:@"Math"],
                       [PNRadarChartDataItem dataItemWithValue:8 description:@"Sports"],
                       [PNRadarChartDataItem dataItemWithValue:5 description:@"Literature"],
                       [PNRadarChartDataItem dataItemWithValue:4 description:@"Other"],
                       ];
    self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 300.0) items:items valueDivider:1];
    self.radarChart.plotColor = [UIColor redColor];
    [self.radarChart strokeChart];
    [self.view addSubview:self.radarChart];
    
}

- (NSArray *)randemSetObjects {
    NSMutableArray *array = [NSMutableArray array];
    NSString *labelFormat = @"%1.f";
    NSMutableArray *XAr = [NSMutableArray array];
    NSMutableArray *YAr = [NSMutableArray array];
    for (int i = 0; i < 25; i++) {
        [XAr addObject:[NSString stringWithFormat:labelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisX_maxValue - self.scatterChart.AxisX_minValue) + self.scatterChart.AxisX_minValue)]];
        [YAr addObject:[NSString stringWithFormat:labelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisY_maxValue - self.scatterChart.AxisY_minValue) + self.scatterChart.AxisY_minValue)]];
    }
    [array addObject:XAr];
    [array addObject:YAr];
    return array;
}

- (void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex {
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d", point.x, point.y, (int) lineIndex, (int) pointIndex);
}

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex {
    NSLog(@"Click on line %f, %f, line index is %d", point.x, point.y, (int) lineIndex);
}

//- (void)userClickedOnBarAtIndex:(NSInteger)barIndex {
//    
//    NSLog(@"Click on bar %@", @(barIndex));
//    
//    PNBar *bar = self.barChart.bars[(NSUInteger) barIndex];
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    
//    animation.fromValue = @1.0;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.toValue = @1.1;
//    animation.duration = 0.2;
//    animation.repeatCount = 0;
//    animation.autoreverses = YES;
//    animation.removedOnCompletion = YES;
//    animation.fillMode = kCAFillModeForwards;
//    
//    [bar.layer addAnimation:animation forKey:@"Float"];
//}

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
