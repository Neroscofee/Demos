//
//  DemosTests.m
//  DemosTests
//
//  Created by Neroscofee on 16/9/6.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface DemosTests : XCTestCase

@property (nonatomic, strong) ViewController *vc;

@end

@implementation DemosTests

- (void)setUp {
    [super setUp];//
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSInteger result = [self.vc getNum];
    XCTAssertEqual(result, 100, @"测试不通过");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (int i=0; i<1000; i++) {
            NSLog(@"%d",i);
        }
    }];
}

@end
