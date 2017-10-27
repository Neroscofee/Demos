//
//  StackTestViewController.m
//  Demos
//
//  Created by Neroscofee on 2017/4/25.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "StackTestViewController.h"
#import "StackForNSObject.h"

@interface StackTestViewController ()

@end

@implementation StackTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"你今天真好看";
    self.view.backgroundColor = [UIColor whiteColor];
    StackForNSObject *stack = [[StackForNSObject alloc] init];
    NSString *string1 = @"MissU";
    NSMutableString *string7 = [[NSMutableString alloc] initWithString:@"sss"];
    
    [stack push:string1];
    NSLog(@"----%@----%d",[[stack popTopElement] class],(int)CFGetRetainCount((__bridge CFTypeRef)(string7)));
    [stack push:string1];
    NSString *string2 = @"ZJW";
    [stack push:string2];
    NSString *string4 = @"So";
    [stack push:string4];
    NSString *string5 = @"sorry";
    [stack push:string5];
    
//    [stack traversalElementFromBottom:^(id objc) {
//        NSLog(@"%@",objc);
//    }];
//    
//    [stack traversalElementPopStack:^(id objc) {
//        NSLog(@"%@",objc);
//    }];
    
    [stack traversalElementFromTop:^(id objc) {
        NSLog(@"%@",objc);
    }];
    
    
    NSString *string3 = @"MissU";
    assert(string3==string1);//断言
    
    NSString *str1 = @"a";
    NSString *str2 = [[@"b" mutableCopy] copy];
    NSLog(@"%@----%d",[str1 class],(int)CFGetRetainCount((__bridge CFTypeRef)(str1)));
    NSLog(@"%@----%d",[str2 class],(int)CFGetRetainCount((__bridge CFTypeRef)(str2)));
    
    
    // Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden {
    return NO;
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
