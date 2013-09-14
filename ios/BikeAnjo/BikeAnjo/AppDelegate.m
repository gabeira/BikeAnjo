//
//  AppDelegate.m
//  BikeAnjo
//
//  Created by Gabriel Pereira on 30/08/13.
//  Copyright (c) 2013 Gabriel Bernardo Pereira. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize deviceAPNToken;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Push Notification - Let the device know we want to receive push notifications
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound)];
    
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

#pragma mark - Push Notification
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    self.deviceAPNToken = [self stringWithDeviceToken:deviceToken];
    NSLog(@"Token load:%@",self.deviceAPNToken);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"PUSH: Error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if (userInfo) {
        for(id key in userInfo.allKeys)
        {
            NSDictionary *apsDict = [userInfo objectForKey:@"aps"];
            [[[UIAlertView alloc] initWithTitle:@"Remote Notification"
                                        message:[apsDict objectForKey:@"alert"]
                                       delegate:self
                              cancelButtonTitle:NSLocalizedString(@"OK_BUTTON",@"Ok")
                              otherButtonTitles:nil]
             show];
            NSLog(@"Push Notification count:%d alert:%@", [[apsDict objectForKey:@"badge"] intValue], [apsDict objectForKey:@"alert"]);
        }
    }else{
        NSLog(@"Push Empty Error");
    }
}

- (NSString*)stringWithDeviceToken:(NSData*)deviceToken {
    const char* data = [deviceToken bytes];
    NSMutableString* token = [NSMutableString string];
    for (int i = 0; i < [deviceToken length]; i++) {
        [token appendFormat:@"%02.2hhX", data[i]];
    }
    return [token copy];
}

@end
