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
@end

@implementation DrawLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.paintingBoard];
    // Do any additional setup after loading the view.
}

- (DrawLine *)paintingBoard {
    if (!_paintingBoard) {
        _paintingBoard = [[DrawLine alloc] initWithFrame:self.view.bounds];
        _paintingBoard.backgroundColor = [UIColor whiteColor];
    }
    return _paintingBoard;
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
