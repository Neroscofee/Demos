//
//  TestCollectionViewController.m
//  Demos
//
//  Created by Neroscofee on 2016/12/26.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "TestCollectionViewController.h"
#import "TestCollectionViewCell.h"
@interface TestCollectionViewController ()

@end

@implementation TestCollectionViewController

//- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
//    UICollectionViewLayout
//}
- (instancetype)init {
    //创建一个流式布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置每个cell的大小
    layout.itemSize = CGSizeMake(80, 80);
    //设置每个cell间的最小水平间距
    layout.minimumInteritemSpacing = 0;
    //设置每个cell间的行间距
    layout.minimumLineSpacing = 5;
    //设置每一组距离四周的内边距
    layout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
    layout.headerReferenceSize = CGSizeMake(0, 40);
    layout.footerReferenceSize = CGSizeMake(0, 40);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //返回
    return [super initWithCollectionViewLayout:layout];
    
}

//- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
//    self = [super initWithCollectionViewLayout:layout];
//    if (self) {
//        
//    }
//}


static NSString * const reuseIdentifier = @"Cell";
static NSString const * identify = @"sg";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"相顾无相识";
    
    identify = @"gsdg";
    
    
    NSString *abc = @"ddd";
    abc = @"ggg";
    NSLog(@"%p",abc);
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(50, 50);
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    flowLayout.minimumInteritemSpacing = 10;
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
//
//
//    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    [self.collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:@"MYCELL"];
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
//    UINavigationItem *item = [UINavigationItem alloc] initWithTitle:<#(nonnull NSString *)#>
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 50, 44);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backForward) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)backForward {
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYCELL" forIndexPath:indexPath];
    if (indexPath.row%2 == 0) {
        cell.displayLabel.text = [NSString stringWithFormat:@"Single"];
        cell.contentView.backgroundColor = [UIColor orangeColor];
    } else {
        cell.displayLabel.text = [NSString stringWithFormat:@"Double"];
        cell.contentView.backgroundColor = [UIColor blueColor];
    }
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    cell.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1);
    [UIView animateWithDuration:0.8 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    TestCollectionViewCell * cell = (TestCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.displayLabel.text = [NSString stringWithFormat:@"Red%ld",(long)indexPath.row];
    cell.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1);
    [UIView animateWithDuration:0.6 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
    
    
    NSLog(@"被点击的是%ld",(long)indexPath.row);
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 星爆 不站T附近
 喷射 中点名分散 不站火池 优先杀虚空之子
 新星 5码四人分担 远离boss
 绝对零度 帮T消冰
 不祥之物 迅速转火大恐魔
 
 萨格拉斯之焰:
 
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
