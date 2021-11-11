//
//  ViewController.m
//  Demos
//
//  Created by Neroscofee on 16/9/6.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "ViewController.h"
#import "TestCollectionViewController.h"
#import "PNChart.h"

typedef void(^returnPreviousPage)(UIAlertAction * _Nonnull action);

@interface ViewController ()
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) id<UITableViewDataSource> dataSource;
@property (nonatomic,strong) UISlider *sd;

@property (nonatomic, strong) UIButton *rbtn;
@property (nonatomic, strong) UILabel *tLabel;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger lnum;
@property (nonatomic, assign) NSInteger tnum;
@property (nonatomic, assign) NSInteger gnum;


@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;

@property (nonatomic, strong) NSArray *mealArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"吃饭听天由命";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tLabel];
    [self.view addSubview:self.rbtn];
//    [self.view addSubview:self.label1];
//    [self.view addSubview:self.label2];
//    [self.view addSubview:self.label3];
    
    self.lnum = 0;
    self.tnum = 0;
    self.gnum = 0;
    
    self.mealArray = [NSArray arrayWithObjects:@"酸菜牛肉",@"锅边洋芋",@"腊排骨",@"夜宴烧烤",@"柴火鸡",@"肥肠耗儿鱼",@"林家饭店",@"喜村土菜馆", nil];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        int num = arc4random()%8;
        NSLog(@"%d",num);
        NSLog(@"那就今晚吃 %@ 吧!", self.mealArray[num]);
        self.tLabel.text = self.mealArray[num];
        self.tLabel.textColor = [UIColor randomColor];
        
        
//        if (num == 1) {
//            self.tLabel.text = @"酸菜牛肉";
//            self.tLabel.textColor = [UIColor redColor];
//        } else if (num == 2) {
//            self.tLabel.text = @"锅边洋芋";
//            self.tLabel.textColor = [UIColor orangeColor];
//        } else if (num == 2) {
//            self.tLabel.text = @"腊排骨";
//            self.tLabel.textColor = [UIColor orangeColor];
//        } else if (num == 2) {
//            self.tLabel.text = @"夜宴烧烤";
//            self.tLabel.textColor = [UIColor orangeColor];
//        } else if (num == 2) {
//            self.tLabel.text = @"柴火鸡";
//            self.tLabel.textColor = [UIColor orangeColor];
//        } else if (num == 2) {
//            self.tLabel.text = @"肥肠耗儿鱼";
//            self.tLabel.textColor = [UIColor orangeColor];
//        } else if (num == 2) {
//            self.tLabel.text = @"林家饭店";
//            self.tLabel.textColor = [UIColor orangeColor];
//        } else {
//            self.tLabel.text = @"喜村土菜馆";
//            self.tLabel.textColor = [UIColor blueColor];
//        }
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    [self.rbtn addTarget:self action:@selector(randomClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    self.sd = [[UISlider alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 50)];
//    self.sd.backgroundColor = [UIColor purpleColor];
//    [self.sd addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:self.sd];
//
//    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 114, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
//    self.myTableView.delegate = self;
//    MyDataSource *ds = [[MyDataSource alloc] init];
//    self.dataSource = ds;
////    [self.myTableView setEditing:YES animated:YES];
//    self.myTableView.dataSource = self.dataSource;
//    [self.view addSubview:self.myTableView];
//    NSLog(@"%f",self.myTableView.tableHeaderView.frame.size.height);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (UILabel *)tLabel {
    if (!_tLabel) {
        _tLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 100, 100, 16)];
        _tLabel.layer.cornerRadius = 8;
//        _tLabel.backgroundColor = [UIColor redColor];
//        _tLabel.textColor = [UIColor whiteColor];
        _tLabel.font = UIFontMake(15);
        _tLabel.text = @"腊排骨";
        _tLabel.textAlignment = NSTextAlignmentCenter;
//        _tLabel.layer.masksToBounds = YES;
    }
    return _tLabel;
}

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, 200, 16)];
        _label1.layer.cornerRadius = 8;
//            _tLabel.backgroundColor = [UIColor redColor];
        _label1.textColor = [UIColor redColor];
        _label1.font = UIFontMake(15);
        _label1.text = @"腊排骨的次数: 0";
        _label1.textAlignment = NSTextAlignmentLeft;
    }
    return _label1;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 330, 200, 16)];
        _label2.layer.cornerRadius = 8;
//            _tLabel.backgroundColor = [UIColor orangeColor];
        _label2.textColor = [UIColor orangeColor];
        _label2.font = UIFontMake(15);
        _label2.text = @"土菜馆的次数: 0";
        _label2.textAlignment = NSTextAlignmentLeft;
    }
    return _label2;
}

- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] initWithFrame:CGRectMake(50, 360, 200, 16)];
        _label3.layer.cornerRadius = 8;
    //        _tLabel.backgroundColor = [UIColor redColor];
        _label3.textColor = [UIColor blueColor];
        _label3.font = UIFontMake(15);
        _label3.text = @"骨肉馆的次数: 0";
        _label3.textAlignment = NSTextAlignmentLeft;
    }
    return _label3;
}

- (UIButton *)rbtn {
    if (!_rbtn) {
        _rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rbtn.frame = CGRectMake((SCREEN_WIDTH-100)/2, 200, 100, 40);
        [_rbtn setTitle:@"停止" forState:UIControlStateNormal];
        [_rbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    }
    return _rbtn;
}

- (void)randomClick:(UIButton *)sender {
    sender.selected ^= 1;
    if (sender.selected) {
        [self.timer setFireDate:[NSDate distantFuture]];
        [self.rbtn setTitle:@"开始随机" forState:UIControlStateNormal];
        if ([self.tLabel.text isEqualToString:@"腊排骨"]) {
            self.lnum++;
            self.label1.text = [NSString stringWithFormat:@"腊排骨的次数: %zd",self.lnum];
            if (self.lnum == 10) {
                [self alertViewWithTarget:self title:@"鸽群此次聚餐定在 腊排骨 !" completion:^(UIAlertAction * _Nonnull action) {
                    [self resetStatus];
                }];
            }
        }
        if ([self.tLabel.text isEqualToString:@"土菜馆"]) {
            self.tnum++;
            self.label2.text = [NSString stringWithFormat:@"土菜馆的次数: %zd",self.tnum];
            if (self.tnum == 10) {
                [self alertViewWithTarget:self title:@"鸽群此次聚餐定在 土菜馆 !" completion:^(UIAlertAction * _Nonnull action) {
                    [self resetStatus];
                }];
            }
        }
        if ([self.tLabel.text isEqualToString:@"骨肉馆"]) {
            self.gnum++;
            self.label3.text = [NSString stringWithFormat:@"骨肉馆的次数: %zd",self.gnum];
            if (self.gnum == 10) {
                [self alertViewWithTarget:self title:@"鸽群此次聚餐定在 骨肉馆 !" completion:^(UIAlertAction * _Nonnull action) {
                    [self resetStatus];
                }];
            }
        }
        
    } else {
        [self.timer setFireDate:[NSDate date]];
        [self.rbtn setTitle:@"停止" forState:UIControlStateNormal];
    }
    
    
    
    
}

- (void)resetStatus {
    self.lnum = 0;
    self.tnum = 0;
    self.gnum = 0;
    self.label1.text = @"腊排骨的次数: 0";
    self.label2.text = @"土菜馆的次数: 0";
    self.label3.text = @"骨肉馆的次数: 0";
    
}

- (void)alertViewWithTarget:(id)target title:(NSString *)alertString completion:(returnPreviousPage)returnPP {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:alertString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ascertain = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:returnPP];
    [alert addAction:ascertain];
    [target presentViewController:alert animated:YES completion:nil];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.y);
//    if (scrollView.contentOffset.y > 0) {
////        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//    } else {
//        NSLog(@"sssssssss");
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//    }
}

- (void)valueChanged:(UISlider *)sender {
    CGFloat height = self.myTableView.contentSize.height;
    CGFloat totalH = height*sender.value;
    CGPoint offset = self.myTableView.contentOffset;
    offset.y = totalH;
    self.myTableView.contentOffset = offset;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewController *tcvc = [[TestCollectionViewController alloc] init];
    //    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:tcvc animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (NSInteger)getNum {
    return 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
