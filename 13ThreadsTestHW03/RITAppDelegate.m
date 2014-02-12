//
//  RITAppDelegate.m
//  13ThreadsTestHW03
//
//  Created by Aleksandr Pronin on 12.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITAppDelegate.h"
#import "RITStudent.h"

@implementation RITAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // initial values
    NSMutableArray* students    = [NSMutableArray array];
    NSInteger       theAnswer   = 33;
    NSInteger       leftValue   = 0;
    NSInteger       rightValue  = 10000000;
    
    // declare block for print results
    void (^resultBlock)(NSString*, NSInteger, CGFloat) = ^(NSString* name, NSInteger answer, CGFloat time) {
        NSLog(@"%@ found the right answer: %d in %f seconds!", name, answer, time);
    };
    
    for (int i = 0; i < 5; i++) {
        RITStudent* student = [[RITStudent alloc] init];
        [students addObject:student];
        student.name = [NSString stringWithFormat:@"Student%02d", i + 1];
        [student guessTheAnswer:theAnswer withRangeFromLeft:leftValue toRight:rightValue andResultBlock:resultBlock];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
