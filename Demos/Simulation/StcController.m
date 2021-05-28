//
//  StcController.m
//  Demos
//
//  Created by Neroscofee on 2020/10/26.
//  Copyright © 2020 Neroscofee. All rights reserved.
//

#import "StcController.h"
#import "SNButton.h"
#import "StcCell.h"
#import "StcModel.h"

@interface StcController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *monthLabel;

@property (nonatomic, strong) UIImageView *arrowleft;
@property (nonatomic, strong) UIImageView *arrowright;
@property (nonatomic, strong) UILabel *midLabel;
@property (nonatomic, strong) UIView *boldLine;

@property (nonatomic, strong) UIImageView *head;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *brief;
@property (nonatomic, strong) UILabel *rule;
@property (nonatomic, strong) UIImageView *calender;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *stcArray;


@end

@implementation StcController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"统计";
    [self getStcData];
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.bounds = CGRectMake(0, 0, 24, 24);
//    [backButton setImage:[UIImage imageNamed:@"BackChevron.png"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(backPrePage) forControlEvents:UIControlEventTouchUpInside];
    //self.view addsubview
    SNButton *backButton = [SNButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(50, 100, 70, 24);
    backButton.layoutType = ButtonLayoutTypeHorizon;
    [backButton setImage:[UIImage imageNamed:@"BackChevron.png"] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.gap = 0;
    backButton.imageSize = CGSizeMake(11, 19);
    backButton.imageAndTitleInset = 7;
    backButton.titleSize = CGSizeMake(35, 19);
    backButton.titleLabel.font = UIFontMake(16);
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(backPrePage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backBarItem;
    
    [self.view addSubview:self.backView];
    [self.backView addSubview:self.weekLabel];
    [self.backView addSubview:self.monthLabel];
    
    [self.view addSubview:self.arrowleft];
    [self.view addSubview:self.arrowright];
    [self.view addSubview:self.midLabel];
    [self.view addSubview:self.boldLine];
    
    
    [self.view addSubview:[SNUtility createSeparateLine:CGRectMake(0, CGRectGetMaxY(self.boldLine.frame)-0.5, SCREEN_WIDTH, 0.5) color:UIColorMake(0xE6E6E6)]];
    [self.view addSubview:self.head];
    [self.view addSubview:self.name];
    [self.view addSubview:self.brief];
    [self.view addSubview:self.rule];
    [self.view addSubview:self.calender];
    [self.view addSubview:[SNUtility createSeparateLine:CGRectMake(0, CGRectGetMaxY(self.head.frame)+15, SCREEN_WIDTH, 1) color:UIColorMake(0xE6E6E6)]];
    
    [self.view addSubview:self.tableView];
    
    self.midLabel.text = self.str5.length > 0 ? self.str5 : @"2020.10";
    self.name.text = self.str6.length > 0 ? self.str6 : @"王小明";
}

- (void)getStcData {
    _stcArray = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"stcData" ofType:@"plist"];
    NSArray *temp = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in temp) {
        StcModel *model = [[StcModel alloc] init];
        model.titleName = dic[@"title"];
        model.amountName = dic[@"amount"];
        model.num = [[dic valueForKey:@"num"] integerValue];
        [_stcArray addObject:model];
    }
}

#pragma mark - LazyLoad
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(17, 15, 104, 28)];
        _backView.backgroundColor = [UIColor clearColor];
        _backView.layer.borderColor = UIColorMake(0x5495F3).CGColor;
        _backView.layer.borderWidth = 1;
        _backView.layer.cornerRadius = 4;
        _backView.clipsToBounds = YES;
    }
    return _backView;
}

- (UILabel *)weekLabel {
    if (!_weekLabel) {
        _weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 52, 28)];
        _weekLabel.textAlignment = NSTextAlignmentCenter;
        _weekLabel.text = @"周";
        _weekLabel.textColor = UIColorMake(0x5495F3);
        _weekLabel.font = [UIFont systemFontOfSize:15];
    }
    return _weekLabel;
}

- (UILabel *)monthLabel {
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 0, 52, 28)];
        _monthLabel.backgroundColor = UIColorMake(0x5495F3);
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        _monthLabel.text = @"月";
        _monthLabel.textColor = [UIColor whiteColor];
        _monthLabel.font = [UIFont systemFontOfSize:15];
    }
    return _monthLabel;
}

- (UIImageView *)arrowleft {
    if (!_arrowleft) {
        _arrowleft = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-157, 22, 11, 19)];
        _arrowleft.image = UIImageMake(@"left.png");
    }
    return _arrowleft;
}

- (UIImageView *)arrowright {
    if (!_arrowright) {
        _arrowright = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-27, 22, 11, 19)];
        _arrowright.image = UIImageMake(@"right.png");
    }
    return _arrowright;
}

- (UILabel *)midLabel {
    if (!_midLabel) {
        _midLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-146, 24, 119, 15)];
        _midLabel.font = UIFontMake(14);
        _midLabel.text = @"2020.10";
        _midLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _midLabel;
}

- (UIView *)boldLine {
    if (!_boldLine) {
        _boldLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.backView.frame)+13, SCREEN_WIDTH, 10)];
        _boldLine.backgroundColor = UIColorMake(0xF8F8F8);
    }
    return _boldLine;
}

- (UIImageView *)head {
    if (!_head) {
        _head = [[UIImageView alloc] initWithFrame:CGRectMake(13, CGRectGetMaxY(self.boldLine.frame)+15, 40, 40)];
        _head.image = UIImageMake(@"heart.png");
        _head.layer.cornerRadius = 20;
        _head.layer.masksToBounds = YES;
    }
    return _head;
}

- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.head.frame)+7, CGRectGetMaxY(self.boldLine.frame)+18, 60, 16)];
        _name.text = @"王小明";
        _name.font = UIFontMake(15);
    }
    return _name;
}

- (UILabel *)brief {
    if (!_brief) {
        _brief = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.head.frame)+7, CGRectGetMaxY(self.name.frame)+5, 100, 15)];
        _brief.font = UIFontMake(14);
        _brief.textColor = UIColorMake(0x516591);
        _brief.text = @"考勤组：总部很多字无法展示";
    }
    return _brief;
}

- (UILabel *)rule {
    if (!_rule) {
        _rule = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.brief.frame), CGRectGetMaxY(self.name.frame)+5, 100, 15)];
        _rule.font = UIFontMake(14);
        _rule.textColor = UIColorMake(0x516591);
        _rule.text = @"（查看规则）";
    }
    return _rule;
}

- (UIImageView *)calender {
    if (!_calender) {
        _calender = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-90, CGRectGetMaxY(self.name.frame)-2, 79, 29.31)];
        _calender.image = UIImageMake(@"calender.png");
    }
    return _calender;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.head.frame)+16, SCREEN_WIDTH, SCREEN_HEIGHT-Fit_NavigationBar_Height-Fit_Bottom_Safe_Height-CGRectGetMaxY(self.head.frame)-16) style:UITableViewStylePlain];
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[StcCell class] forCellReuseIdentifier:NSStringFromClass([StcCell class])];
    }
    return _tableView;
}

#pragma mark - Actions
- (void)backPrePage {
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 49;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stcArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StcCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StcCell class]) forIndexPath:indexPath];
    if (!cell) {
        cell = [[StcCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([StcCell class])];
    }
    cell.model = [self.stcArray objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
//        self.str1.length > 0 ? [NSString stringWithFormat:@"%@小时",self.str1] : cell.model.titleName;
        cell.model.amountName = self.str1.length > 0 ? [NSString stringWithFormat:@"%@小时",self.str1] : cell.model.amountName;
    } else if (indexPath.row == 1) {
        cell.model.amountName = self.str2.length > 0 ? [NSString stringWithFormat:@"%@天",self.str2] : cell.model.amountName;
    } else if (indexPath.row == 2) {
        cell.model.amountName = self.str3.length > 0 ? [NSString stringWithFormat:@"共%@次",self.str3] : cell.model.amountName;
    } else if (indexPath.row == 3) {
        cell.model.amountName = self.str4.length > 0 ? [NSString stringWithFormat:@"%@天",self.str4] : cell.model.amountName;
    }


    
    
    [cell loadData];

    
    return cell;
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
