//
//  NearToFarCollection.m
//  Demos
//
//  Created by Neroscofee on 2023/2/28.
//  Copyright © 2023 Neroscofee. All rights reserved.
//

#import "NearToFarCollection.h"
#import "MyCollectionViewFlowLayout.h"
#import "NearToFarCollectionViewCell.h"

static NSString *const cellID = @"pCell";
@interface NearToFarCollection ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation NearToFarCollection

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyCollectionViewFlowLayout *layout = [[MyCollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(420, 420);
//    layout.minimumInteritemSpacing = 25;
    layout.minimumLineSpacing = -140;
    CGFloat dis = (Fit_Content - 420) * 0.5;
    dis = 0.0;
    layout.sectionInset = UIEdgeInsetsMake(dis, 0, dis, 0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Fit_Content) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor orangeColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[NearToFarCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NearToFarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor randomColor];
//    cell.imageView.image = UIImageMake(image)
    NSString *picName = [NSString stringWithFormat:@"GLASS-%zd.png",indexPath.row];
    cell.imageView.image = UIImageMake(picName);
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
