//
//  NSCatViewController.m
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import "NSCatViewController.h"

@interface NSCatViewController ()

@property (nonatomic, strong) UIImageView *catImgageView;
@property (nonatomic, strong) UIButton *showButton;

@end

@implementation NSCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.catImgageView];
    [self.view addSubview:self.showButton];
    
}

- (UIImageView *)catImgageView {
    if (!_catImgageView) {
        _catImgageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-40, 400)];
    }
    return _catImgageView;
}

- (UIButton *)showButton {
    if (!_showButton) {
        _showButton = [UIButton buttonWithType:UIButtonTypeCustom];

        _showButton.frame = CGRectMake((SCREEN_WIDTH-74)/2, 20, 74, 44);
        _showButton.layer.cornerRadius = 10;
        [_showButton setTitle:@"show me!" forState:UIControlStateNormal];
    }
    return _showButton;
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
