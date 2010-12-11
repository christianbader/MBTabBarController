//
//  MBTabBarController.h
//  MBTabBarController
//
//  Created by Christian Bader on 12/9/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

@class GradientView;

@interface MBTabBarController : UITabBarController {

	GradientView *gradientView;
	
	UIColor *tabBarTintColor;
	BOOL tabBarGradient;
}

@property (nonatomic, retain) UIColor *tabBarTintColor;
@property (nonatomic, assign) BOOL tabBarGradient;

- (void)setTabBarTintColor:(UIColor *)aTintColor;

@end
