//
//  SiwxController.m
//  Demos
//
//  Created by Neroscofee on 2021/3/3.
//  Copyright © 2021 Neroscofee. All rights reserved.
//

#import "SiwxController.h"
#import "NSAttributedString+AttributedString.h"

@interface SiwxController ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIImageView *arrowIV;

@end

@implementation SiwxController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor backGrayColor];
    
    [self.view addSubview:self.backView];
    
    [self.backView addSubview:[SNUtility createLabelWithFrame:CGRectMake(20, 20, 150, 18) text:self.headString font:17 bold:NO textColor:[UIColor blackColor] alignment:NSTextAlignmentLeft]];
    [self.backView addSubview:[SNUtility createLabelWithFrame:CGRectMake(20, 43, 150, 16) text:self.dateString font:15 bold:NO textColor:[UIColor lightGrayColor] alignment:NSTextAlignmentLeft]];
    
    NSMutableAttributedString *testStr1 = [self stringWithString:self.longString font:UIFontMake(16) lineSpace:4];
    CGSize testSize1 = [testStr1 sizeWithMaxSize:CGSizeMake(SCREEN_WIDTH-70-40, CGFLOAT_MAX)];
    self.tipLabel.frame = CGRectMake(20, 75, testSize1.width, testSize1.height);
    self.tipLabel.textColor = [UIColor blackColor];
    self.tipLabel.numberOfLines = 3;
    self.tipLabel.attributedText = testStr1;
    [self.tipLabel sizeToFit];
    [self.backView addSubview:self.tipLabel];
    
    [self.backView addSubview:[SNUtility createLabelWithFrame:CGRectMake(20, CGRectGetMaxY(self.tipLabel.frame)+20, 270, 17) text:@"你可以点击\"详情\"查看更多信息。" font:16 bold:NO textColor:[UIColor blackColor] alignment:NSTextAlignmentLeft]];
    
    [self.backView addSubview:[SNUtility createSeparateLine:CGRectMake(20, CGRectGetMaxY(self.tipLabel.frame)+20+18+20, SCREEN_WIDTH-70-40, 2) color:[UIColor lineColor]]];
    [self.backView addSubview:[SNUtility createLabelWithFrame:CGRectMake(20, CGRectGetMaxY(self.tipLabel.frame)+20+18+20+2+10, 40, 17) text:@"详情" font:16 bold:NO textColor:[UIColor blackColor] alignment:NSTextAlignmentLeft]];
    
    [self.backView addSubview:self.arrowIV];
    
    // Do any additional setup after loading the view.
}

#pragma mark - LazyLoad
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(35, 200, SCREEN_WIDTH-70, 250)];
        _backView.layer.cornerRadius = 5;
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIImageView *)arrowIV {//78 120
    if (!_arrowIV) {
        _arrowIV = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-70-20-10.4, CGRectGetMaxY(self.tipLabel.frame)+20+18+20+2+9, 9.75, 15)];
        _arrowIV.image = UIImageMake(@"go.png");
    }
    return _arrowIV;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
    }
    return _tipLabel;
}

- (NSMutableAttributedString *)stringWithString:(NSString *)string font:(UIFont *)font lineSpace:(CGFloat)lineSpace {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle}];
    return attributedString;
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
