//
//  MBTabBarControllerAppDelegate.h
//  MBTabBarController
//
//  Created by Christian Bader on 12/9/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

@class MBTabBarController;

@interface MBTabBarControllerAppDelegate : NSObject <UIApplicationDelegate> {
	MBTabBarController *mbTabBarController;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

