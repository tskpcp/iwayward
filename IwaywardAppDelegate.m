//
//  AppDelegate.m
//  iwayward
//
//  Created by caopeng on 15/2/27.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "IwaywardAppDelegate.h"

@interface IwaywardAppDelegate ()

@property (nonatomic, strong) ZWIntroductionViewController *introductionView;

@end

@implementation IwaywardAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];

   /*
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    //显示状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    LoadingViewController *LoadingView = [[LoadingViewController alloc] init];
    self.nav = [[[UINavigationController alloc] initWithRootViewController:LoadingView] autorelease];
    self.nav.navigationBarHidden = NO;
    [LoadingView release];
    self.window.rootViewController = self.nav;
    [self.window makeKeyAndVisible];
    
    */
    
    NSString *iwaywardDbPath=[CommonHelper dataFilePath:@"iwayward.db"];
     NSLog(@"\n ===> DB=%@",iwaywardDbPath);
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:iwaywardDbPath]){
        DBHelperController *dhc=[[DBHelperController alloc] init];
        [dhc initDatabase];
    }
    
    
     //首次加载使用
    NSArray *coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    NSArray *backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    self.introductionView = [[ZWIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames];
    
    [self.window addSubview:self.introductionView.view];
    
    __weak IwaywardAppDelegate *weakSelf = self;
    self.introductionView.didSelectedEnter = ^() {
        [weakSelf.introductionView.view removeFromSuperview];
        weakSelf.introductionView = nil;
        
        // enter main view , write your code ...
        //可以在这个block里面进入自己的主VC
        //[[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
        
        UINavigationController *navC=[[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
        self.window.rootViewController = navC;
        
        [self.window makeKeyAndVisible];


        
    };
   

    /*
    //再次加载时使用
    UINavigationController *navC=[[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    self.window.rootViewController = navC;
    
    [self.window makeKeyAndVisible];
     */
    return YES;
}
//挂起

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    //当有电话进来或者锁屏，这时你的应用程会挂起，在这时，UIApplicationDelegate委托会收到通知，调用 applicationWillResignActive 方法，你可以重写这个方法，做挂起前的工作，比如关闭网络，保存数据
    
     NSLog(@"\n ===> 程序暂行 !");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
     NSLog(@"\n ===> 程序进入后台 !");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    NSLog(@"\n ===> 程序进入前台 !");
}
//复原
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //当程序复原时，另一个名为 applicationDidBecomeActive 委托方法会被调用，在此你可以通过之前挂起前保存的数据来恢复你的应用程序：
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"\n ===> 程序意外暂行 !");
}

@end
