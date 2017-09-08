//
//  ViewController.m
//  Demo9_6
//
//  Created by 石飞龙 on 16/9/6.
//  Copyright © 2016年 石飞龙. All rights reserved.
//

#import "ViewController.h"
#import "TestCollectionViewController.h"
#import "PNChart.h"

@interface ViewController ()
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) id<UITableViewDataSource> dataSource;
@property (nonatomic,strong) UISlider *sd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"+V";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.sd = [[UISlider alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 50)];
    self.sd.backgroundColor = [UIColor purpleColor];
    [self.sd addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.sd];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 114, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    MyDataSource *ds = [[MyDataSource alloc] init];
    self.dataSource = ds;
//    [self.myTableView setEditing:YES animated:YES];
    self.myTableView.dataSource = self.dataSource;
    [self.view addSubview:self.myTableView];
    NSLog(@"%f",self.myTableView.tableHeaderView.frame.size.height);
    
    
    // Do any additional setup after loading the view, typically from a nib.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
