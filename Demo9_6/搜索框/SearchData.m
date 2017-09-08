//
//  SearchData.m
//  Demo9_6
//
//  Created by 石飞龙 on 2016/12/21.
//  Copyright © 2016年 石飞龙. All rights reserved.
//

#import "SearchData.h"

@implementation SearchData

+ (NSArray *)demoData {
    SearchData *s1 = [[SearchData alloc] init];
    s1.name = @"iPhone4S";
    s1.type = TPTypeDevice;
    SearchData *s2 = [[SearchData alloc] init];
    s2.name = @"Xcode";
    s2.type = TPTypeSoft;
    SearchData *s3 = [[SearchData alloc] init];
    s3.name = @"iPhone5";
    s3.type = TPTypeDevice;
    SearchData *s4 = [[SearchData alloc] init];
    s4.name = @"shadowsocks";
    s4.type = TPTypeSoft;
    SearchData *s5 = [[SearchData alloc] init];
    s5.name = @"Mac OX";
    s5.type = TPTypeOther;
    SearchData *s6 = [[SearchData alloc] init];
    s6.name = @"iPhone6S";
    s6.type = TPTypeDevice;
    SearchData *s7 = [[SearchData alloc] init];
    s7.name = @"Cornerstone";
    s7.type = TPTypeSoft;
    
    return @[s1, s2, s3, s4, s5, s6, s7];
    
}

@end
