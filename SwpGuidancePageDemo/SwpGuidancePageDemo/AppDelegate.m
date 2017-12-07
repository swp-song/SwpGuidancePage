//
//  AppDelegate.m
//  SwpGuidancePageDemo
//
//  Created by swp_song on 2016/11/8.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "SwpGuidancePageHeader.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window                 = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self setRootViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setRootViewController {
    
    
    // 请修改 App  Build  版本号
    __weak typeof(self) selfController = self;
    
    SwpGuidancePage *swpGuidancePage   = [SwpGuidancePage swpGuidanceWithDataSource:@[@"guidance_page_1", @"guidance_page_2", @"guidance_page_3"]];
    
    swpGuidancePage.swpGuidancePageNumberOfPagesColor    = [UIColor colorWithHue:0.96 saturation:0.64 brightness:1.00 alpha:1.00];
    swpGuidancePage.swpGuidancePageCurrentPageColor      = [UIColor colorWithHue:0.56 saturation:0.71 brightness:1.00 alpha:1.00];
    swpGuidancePage.swpGuidancePageButtonBackgroundColor = [UIColor colorWithHue:0.57 saturation:0.84 brightness:0.89 alpha:1.00];
    swpGuidancePage.swpGuidancePageButtonTextColor       = [UIColor whiteColor];
    

    
    [SwpGuidancePage swpGuidancePageCheckAppVersion:^(NSString * _Nonnull version) {
        selfController.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    } appVersionNotSame:^BOOL(NSString * _Nonnull appVersion, NSString * _Nonnull oldVersion) {
        selfController.window.rootViewController = swpGuidancePage;
        // 不保存版本号
        return YES;
    }];
    
    // 滑动 隐藏，点击进入按钮 App
    [swpGuidancePage swpGuidanceLastCell:^{
        selfController.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    }];
}



@end
