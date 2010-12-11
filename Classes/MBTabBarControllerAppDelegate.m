//
//  MBTabBarControllerAppDelegate.m
//  MBTabBarController
//
//  Created by Christian Bader on 12/9/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

#import "MBTabBarControllerAppDelegate.h"
#import "MBTabBarController.h"
#import "MBTabBarItem.h"

@implementation MBTabBarControllerAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    mbTabBarController = [[MBTabBarController alloc] initWithNibName:nil bundle:nil];
	
	// Custom configuration of the tabbar
	mbTabBarController.tabBarGradient = YES;
	mbTabBarController.tabBarTintColor = [UIColor colorWithRed:0.0 green:0.32 blue:0.47 alpha:1.0];
	
	MBTabBarItem *firstItem = [[[MBTabBarItem alloc] initWithTitle:@"Home" 
												   unselectedImage:[UIImage imageNamed:@"house.png"] 
													 selectedImage:[UIImage imageNamed:@"house_selected.png"]
															   tag:0] autorelease];
	
	MBTabBarItem *secondItem = [[[MBTabBarItem alloc] initWithTitle:@"Home" 
													unselectedImage:[UIImage imageNamed:@"house.png"] 
													  selectedImage:[UIImage imageNamed:@"house_selected.png"] 
																tag:0] autorelease];
	
	 
	UIViewController *firstViewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
	firstViewController.tabBarItem = firstItem;
	UIViewController *secondViewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
	secondViewController.tabBarItem = secondItem;
	
	mbTabBarController.viewControllers = [NSArray arrayWithObjects:firstViewController, secondViewController, nil];
	[firstViewController release];
	[secondViewController release];
	
	[self.window addSubview:mbTabBarController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[mbTabBarController release];
    [window release];
    [super dealloc];
}


@end
