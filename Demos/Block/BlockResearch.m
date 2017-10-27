//
//  BlockResearch.m
//  Demos
//
//  Created by Neroscofee on 2017/3/2.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "BlockResearch.h"
#import "DetailViewController.h"


typedef void (^doAnotherThing) (void);
typedef NSString *(^tellYouWillDoWhat) (void);
static NSString *cellID;
@interface BlockResearch ()
{
    int a;
}

@end

@implementation BlockResearch

- (void)viewDidLoad {
    [super viewDidLoad];
    //    a = 10;
    //    NSLog(@"我在玩手机");
    //    NSLog(@"手机没电了");
    ////    [self electricIsFullNow];
    ////    [self performSelector:@selector(electricIsFullNow:) withObject:nil afterDelay:10];
    //    [self electricIsFullNow:^{
    //        NSLog(@"去逛街");
    //    }];
    //
    ////    [self showSomething:^NSString *{
    //////        NSLog(@"sdf");
    ////        NSString *str = [NSString stringWithFormat:@"继续玩手机"];
    ////        return str;
    ////    }];
    //
    //    NSLog(@"我边看电视边等手机充好电");
    
    [self createTableView];
    [self initDataWithTableView];
    
}

- (void)electricIsFullNow:(doAnotherThing)sender {
    //    [NSThread sleepForTimeInterval:10];
    //    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(computeTime:) userInfo:nil repeats:YES];
    double delaySeconds = 10;
    dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySeconds*NSEC_PER_SEC));
    dispatch_after(poptime, dispatch_get_main_queue(), ^{
        NSLog(@"手机充好电了");
        //        NSString *str = @"adfsgg";
        sender();
    });
}

- (void)showSomething:(tellYouWillDoWhat)conversation {
    double t = 4;
    dispatch_time_t pt = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(t*NSEC_PER_SEC));
    dispatch_after(pt, dispatch_get_main_queue(), ^{
        NSLog(@"%@",conversation());
    });
}




- (void)computeTime:(NSTimer *)timer {
    if (a > 0) {
        NSLog(@"%d",a);
        a--;
    } else {
        [timer invalidate];
        
    }
}

- (void)createTableView {
    UITableView *tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tab.delegate = self;
    tab.dataSource = self;
    tab.separatorInset = UIEdgeInsetsMake(0, 0, 0, 10);
    self.table = tab;
    [self.view addSubview:self.table];
}

- (void)initDataWithTableView {
    self.dataArray = [[NSMutableArray alloc] init];
    for (int i = 1; i < 10; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.table reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.text = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
    NSLog(@"1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
