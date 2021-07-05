//
//  AppDelegate.m
//  rs.ios.stage-task7
//
//  Created by Mishka on 04.07.2021.
//

#import "AppDelegate.h"
#import "RSViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    ViewController *viewContr = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//
//
//    self.window.backgroundColor = [UIColor greenColor];
//    [self.window makeKeyAndVisible];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    RSViewController *rootVC = [[RSViewController alloc] initWithNibName:@"RSViewController" bundle:nil];
    [self.window setRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
