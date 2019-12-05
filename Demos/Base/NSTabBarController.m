//
//  NSTabBarController.m
//  Demos
//
//  Created by Neroscofee on 2019/12/5.
//  Copyright © 2019 Neroscofee. All rights reserved.
//

#import "NSTabBarController.h"
#import "NSNavigationController.h"
#import "FireViewController.h"
#import "NSCatViewController.h"
#import "UIImage+NSImage.h"

@interface NSTabBarController ()

@end

@implementation NSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    FireViewController *fireVC = [[FireViewController alloc] init];
    fireVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:UIOriginalImageMake(@"cat_fagu.png") selectedImage:UIOriginalImageMake(@"cat_mask.png")];
    fireVC.navigationItem.title = @"夜空中💓最亮的你";
    NSNavigationController *fireNavi = [[NSNavigationController alloc] initWithRootViewController:fireVC];
    
    NSCatViewController *catVC = [[NSCatViewController alloc] init];
    
    
    catVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:UIOriginalImageMake(@"cat_fagu.png") selectedImage:UIOriginalImageMake(@"cat_mask.png")];
    catVC.navigationItem.title = @"给我一只🐱~";
    NSNavigationController *catNavi = [[NSNavigationController alloc] initWithRootViewController:catVC];
    
    self.tabBar.tintColor = [UIColor redColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.shadowImage = [UIImage imageWithColor:UIColorMake(0xEEEEEE)];
    self.tabBar.backgroundImage = [[UIImage alloc] init];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:fireNavi];
    [self addChildViewController:catNavi];
    self.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
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
