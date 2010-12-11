    //
//  MBTabBarController.m
//  MBTabBarController
//
//  Created by Christian Bader on 12/9/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

#import "MBTabBarController.h"
#import "GradientView.h"

@implementation MBTabBarController

@synthesize tabBarTintColor;
@synthesize tabBarGradient;

#pragma mark -
#pragma mark Initialization and destruction

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
	}
	return self;
}

- (void)dealloc {
	[tabBarTintColor release];
	[gradientView release];
    [super dealloc];
}

#pragma mark -
#pragma mark View handling

- (void)viewDidLoad {
	[super viewDidLoad];
	
	CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, 49);
	gradientView = [[GradientView alloc] initWithFrame:frame];
	gradientView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	[[self tabBar] insertSubview:gradientView atIndex:0];
}

#pragma mark -
#pragma mark Rotation hadling

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	
	return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
			toInterfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Accessor methods

- (UIColor *)tabBarTintColor {
	return tabBarTintColor;
}

- (void)setTabBarTintColor: (UIColor *)newValue {
	[tabBarTintColor autorelease];
	tabBarTintColor = [newValue retain];
	
	gradientView.tintColor = newValue;
}

- (void)setTabBarGradient:(BOOL)aGradient {
	tabBarGradient = aGradient;
	
	gradientView.gradient = aGradient;
}

@end
