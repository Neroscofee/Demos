//
//  DrawLineViewController.m
//  Demos
//
//  Created by Neroscofee on 2017/2/24.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "DrawLineViewController.h"
#import "DrawLine.h"

@interface DrawLineViewController ()

@property (nonatomic, strong) DrawLine *paintingBoard;
@property (nonatomic, strong) UIButton *colorButton;
@property (nonatomic, strong) UISlider *lineWidthSlider;
@property (nonatomic, strong) UISlider *alphaSlider;

@end

@implementation DrawLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.paintingBoard];
    [self.view addSubview:self.colorButton];
    [self.view addSubview:self.lineWidthSlider];
    [self.view addSubview:self.alphaSlider];
    // Do any additional setup after loading the view.
    
    [self.colorButton addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.lineWidthSlider addTarget:self action:@selector(changeLineWidth:) forControlEvents:UIControlEventValueChanged];
    [self.alphaSlider addTarget:self action:@selector(changeAlpha:) forControlEvents:UIControlEventValueChanged];
}

- (DrawLine *)paintingBoard {
    if (!_paintingBoard) {
//        _paintingBoard = [[DrawLine alloc] initWithFrame:self.view.bounds];
        _paintingBoard = [[DrawLine alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_NavigationBar_Height-Fit_Bottom_Safe_Height-40)];
//        CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-)
        _paintingBoard.backgroundColor = [UIColor whiteColor];
    }
    return _paintingBoard;
}

- (UIButton *)colorButton {
    if (!_colorButton) {
        _colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _colorButton.frame = CGRectMake(20, CGRectGetMaxY(self.paintingBoard.frame), 50, 40);
        _colorButton.backgroundColor = [UIColor redColor];
    }
    return _colorButton;
}

- (UISlider *)lineWidthSlider {
    if (!_lineWidthSlider) {
        _lineWidthSlider = [[UISlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.colorButton.frame) + 20, CGRectGetMaxY(self.paintingBoard.frame), 100, 40)];
        _lineWidthSlider.value = 1.0;
        _lineWidthSlider.minimumValue = 0.1;
        _lineWidthSlider.maximumValue = 20.0;
    }
    return _lineWidthSlider;
}

- (UISlider *)alphaSlider {
    if (!_alphaSlider) {
        _alphaSlider = [[UISlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.lineWidthSlider.frame) + 20, CGRectGetMaxY(self.paintingBoard.frame), 100, 40)];
        _alphaSlider.value = 1.0;
        _alphaSlider.minimumValue = 0;
        _alphaSlider.maximumValue = 1.0;
    }
    return _alphaSlider;
}

- (void)changeColor {
    self.colorButton.selected = !self.colorButton.selected;
    if (self.colorButton.selected) {
        self.paintingBoard.colorValue = 0;
        self.colorButton.backgroundColor = [UIColor blueColor];
    } else {
        self.paintingBoard.colorValue = 1;
        self.colorButton.backgroundColor = [UIColor redColor];
    }
}

- (void)changeLineWidth:(UISlider *)slider {
    NSLog(@"当前滑动值为: %.f",slider.value);
    self.paintingBoard.lineWidth = slider.value;
}

- (void)changeAlpha:(UISlider *)slider {
    NSLog(@"当前透明度为: %.2f",slider.value);
    self.paintingBoard.lineAlpha = slider.value;
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
