//
//  MBTabBarController.h
//  MBTabBarController
//
//  Created by Christian Bader on 12/9/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

@class GradientView;
@class ArrowView;

@interface MBTabBarController : UITabBarController {

	GradientView *gradientView;

	UIColor *tabBarTintColor;
	BOOL tabBarGradient;

	ArrowView *arrow;

	int pos;
	BOOL initial;
	BOOL arrowHidden;
}

@property (nonatomic, retain) UIColor *tabBarTintColor;
@property (nonatomic, assign) BOOL tabBarGradient;
@property (nonatomic, assign) BOOL arrowHidden;

- (void)setTabBarTintColor:(UIColor *)aTintColor;

@end
