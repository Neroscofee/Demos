//
//  AppDelegate.m
//  Demos
//
//  Created by Neroscofee on 16/9/6.
//  Copyright © 2017年 Neroscofee. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "SearchData.h"
#import "SearchTableViewController.h"

#import "TestCollectionViewController.h"
#import "TestViewController.h"

#import "PNChartViewController.h"

//2.24
#import "DrawLineViewController.h"

//3.1
#import "ProtocolViewController.h"
//3.2
#import "BlockPassNumFirst.h"
//3.3
#import "ActionButtonViewController.h"
#import "BlockButtonViewController.h"
#import "AssociateViewController.h"
//3.8
#import "AnimationTimer.h"
//4.25
#import "StackTestViewController.h"
//4.28
#import "SnowViewController.h"
//9.4
#import "RecipeController.h"
//9.5
#import "FireViewController.h"
//11.21
#import "DynamicMenuViewController.h"
//7.11
#import "DealerProxy.h"
//7.27
#import "GCDViewController.h"

#import "NSTabBarController.h"
#import "NSNavigationController.h"

#import "WelcomeViewController.h"
#import "NSFrameworkManager.h"

#import "SimuController.h"
#import "ChargeController.h"

#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"App启动时调用此方法!");
    // Override point for customization after application launch.
//    DealerProxy *dp = [DealerProxy dealerProxy];
//    [dp purchaseToyWithTitle:@"变形金刚"];
//    [dp purchasePantsWithSize:PantsSizeMedium];
    
    
    
    
    
//    ViewController *vc = [[ViewController alloc] init];//表视图
    
//    TestViewController *vc = [[TestViewController alloc] init];
//    self.window.rootViewController = vc;

//    SearchTableViewController *vc = [[SearchTableViewController alloc] init];
//    vc.products = [SearchData demoData];
    
//    UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
//    SearchTableViewController *stvc = (SearchTableViewController *)navi.topViewController;
//    stvc.products = [SearchData demoData];
    
//    PNChartViewController *vc = [[PNChartViewController alloc] init];//折线图
//    DrawLineViewController *vc = [[DrawLineViewController alloc] init];//画线
//    ProtocolViewController *vc = [[ProtocolViewController alloc] init];//协议传值
//    BlockPassNumFirst *vc = [[BlockPassNumFirst alloc] init];//block传值
//    ActionButtonViewController *vc = [[ActionButtonViewController alloc] init];//runtime 关联
//    BlockButtonViewController *vc = [[BlockButtonViewController alloc] init];//用block来与button关联
//    AssociateViewController *vc = [[AssociateViewController alloc] init];//tableView与alertView关联
//    AnimationTimer *vc = [[AnimationTimer alloc] init];//用timer生成动画
//    StackTestViewController *vc = [[StackTestViewController alloc] init];//用OC实现栈
//        SnowViewController *vc = [[SnowViewController alloc] init];//下雪动画
//    RecipeController *vc = [[RecipeController alloc] init];//用plist当Model源
    
    FireViewController *vc = [[FireViewController alloc] init];//烟花
//    DynamicMenuViewController *vc = [[DynamicMenuViewController alloc] init];
//    GCDViewController *vc = [[GCDViewController alloc] init];
//    SimuController *vc = [[SimuController alloc] init];
//    ChargeController *vc = [[ChargeController alloc] init];
//    self.window.rootViewController = vc;
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navi;
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//    navi.navigationBar.barStyle = UIBarStyleBlack;
   
//    [NSThread sleepForTimeInterval:2];

    
    
//    NSTabBarController *tabBarController = [[NSTabBarController alloc] init];
//    self.rootNaviController = [[NSNavigationController alloc] initWithRootViewController:tabBarController];
//    self.window.rootViewController = self.rootNaviController;
    
    NSLog(@"%@",[[UIScreen mainScreen] currentMode]);
    NSLog(@"%f",SCREEN_WIDTH);
    NSLog(@"%f",SCREEN_HEIGHT);
    NSLog(@"%f",Fit_NavigationBar_Height);
    NSLog(@"%f",Fit_Bottom_Safe_Height);
    
//    [self applicationFramework];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [UINavigationBar appearance].translucent = NO;//可以影响界面锚点 NO 锚点从导航栏下开始
    
//    [self checkCodesign];
    
    
//    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0f) {
//        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
//        if (UIUserNotificationTypeNone == setting.types) {
//            NSLog(@"推送关闭");
//            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge)   categories:nil]];
//            
//            [[UIApplication sharedApplication] registerForRemoteNotifications];
//        }else{
//            NSLog(@"推送打开");
//            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge)   categories:nil]];
//            
//            [[UIApplication sharedApplication] registerForRemoteNotifications];
//        }
//    }else{
//        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
//        if(UIRemoteNotificationTypeNone == type){
//            NSLog(@"推送关闭");
//        }else{
//            NSLog(@"推送打开");
//            [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge)];
//        }
//    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"应用从活动状态进入到非活动状态时调用此方法!");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"应用进入后台时调用此方法!");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"应用进入到前台但还未处于活动状态时调用此方法!");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"应用进入前台并处于活动状态时调用此方法!");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"应用被杀死时调用此方法!");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationFramework {
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.enable = YES;
    keyboardManager.enableAutoToolbar = NO;
    keyboardManager.shouldResignOnTouchOutside = YES;
    
    NSFrameworkManager *frameworkManager = [NSFrameworkManager sharedInstance];
//    frameworkManager.welcomeFrameworkHandle = ^{
//        WelcomeViewController *vc = [[WelcomeViewController alloc] init];
//        NSNavigationController *navi = [[NSNavigationController alloc] initWithRootViewController:vc];
//        self.window.rootViewController = navi;
//    };
//    frameworkManager.mainFrameworkHandle = ^{
//        NSTabBarController *tabBC = [[NSTabBarController alloc] init];
//        NSNavigationController *navi = [[NSNavigationController alloc] initWithRootViewController:tabBC];
//        self.window.rootViewController = navi;
//    };
//    [frameworkManager toWelcomeFramework];
    
    
    frameworkManager.mainFrameworkHandle = ^{
        MainViewController *vc = [[MainViewController alloc] init];
        NSNavigationController *navi = [[NSNavigationController alloc] initWithRootViewController:vc];
        self.window.rootViewController = navi;
    };
    [frameworkManager toMainFramework];
}

- (void)checkCodesign {
    // 描述文件路径
    NSString *embeddedPath = [[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"];
    // 读取com.apple.developer.team-identifier  注意描述文件的编码要使用:NSASCIIStringEncoding
    NSString *embeddedProvisioning = [NSString stringWithContentsOfFile:embeddedPath encoding:NSASCIIStringEncoding error:nil];
    NSArray *embeddedProvisioningLines = [embeddedProvisioning componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    for (int i = 0; i < embeddedProvisioningLines.count; i++) {
        if ([embeddedProvisioningLines[i] rangeOfString:@"com.apple.developer.team-identifier"].location != NSNotFound) {
            
            NSInteger fromPosition = [embeddedProvisioningLines[i+1] rangeOfString:@"<string>"].location+8;
            
            NSInteger toPosition = [embeddedProvisioningLines[i+1] rangeOfString:@"</string>"].location;
            
            NSRange range;
            range.location = fromPosition;
            range.length = toPosition - fromPosition;
            
            NSString *fullIdentifier = [embeddedProvisioningLines[i+1] substringWithRange:range];
            //NSArray *identifierComponents = [fullIdentifier componentsSeparatedByString:@"."];
          //  NSString *appIdentifier = [identifierComponents firstObject];
       
            // 对比签名ID
            if (![fullIdentifier isEqual:@"GEK8BQKJRQ"]) {
                //以下等于exit(0)
//                asm("mov X0,#0\n""mov w16,#1\n""svc #0x80");
                return;
            }
            break;
        }
    }
}

@end
