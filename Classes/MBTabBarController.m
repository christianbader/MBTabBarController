    //
//  MBTabBarController.m
//  MBTabBarController
//
//  Created by Christian Bader on 12/9/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

#import "MBTabBarController.h"
#import "ArrowView.h"
#import "GradientView.h"

#pragma mark -
#pragma mark Private method declarations

@interface MBTabBarController (PrivateMethods)

- (void)calculateArrowPos;
- (void)moveArrow:(BOOL)animated;

@end

@implementation MBTabBarController

@synthesize tabBarTintColor;
@synthesize tabBarGradient;
@synthesize arrowHidden;

#pragma mark -
#pragma mark Initialization and destruction

- (void)dealloc {
	[arrow release];
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
	gradientView.clipsToBounds = NO;
	
	[[self tabBar] insertSubview:gradientView atIndex:0];
	
	arrow = [[ArrowView alloc] initWithFrame:CGRectMake(0.0, -7.0, 10.0, 7.0)];
	[gradientView addSubview:arrow];	
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	initial = YES;
}

#pragma mark -
#pragma mark Rotation hadling

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	
	return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
			toInterfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[self calculateArrowPos];
	[self moveArrow:NO];
}

#pragma mark -
#pragma mark Accessor methods

- (UIColor *)tabBarTintColor {
	return tabBarTintColor;
}

- (void)setTabBarTintColor: (UIColor *)newValue {
	[tabBarTintColor autorelease];
	tabBarTintColor = [newValue retain];
	
	arrow.tintColor = newValue;
	gradientView.tintColor = newValue;
}

- (void)setTabBarGradient:(BOOL)aGradient {
	tabBarGradient = aGradient;
	
	gradientView.gradient = aGradient;
}

- (void)setArrowHidden:(BOOL)newValue {
	arrowHidden = newValue;
	arrow.alpha = newValue ? 0.0 : 1.0;
}

#pragma mark -
#pragma mark Overwritten methods

- (void)setSelectedViewController:(UIViewController *)aViewController {
	[super setSelectedViewController:aViewController];
	
	[self calculateArrowPos];
	[self moveArrow:!initial];
	initial = NO;
}

#pragma mark -
#pragma mark Helper methods

- (void)calculateArrowPos {
	
	NSUInteger selectedItem = NSNotFound;
	selectedItem = self.selectedIndex;
	
	if (selectedItem != NSNotFound) {
		selectedItem+=1;
	}
	
	// Get the width of an item
	int itemCount;
	itemCount = self.tabBar.items.count;
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		// TODO: max tabbar items on iPad?
	} else {
		if (itemCount >= 5) { // Workatound
			
			itemCount = 5;
			
			if (selectedItem == NSNotFound || selectedItem >= itemCount) {
				selectedItem = itemCount;
			}
		}
	}
	
	float itemWidth;
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		// TODO: get arrow position for ipad
		arrowHidden = YES;
	} else {
		itemWidth = self.view.bounds.size.width / itemCount;
		pos = selectedItem * itemWidth - itemWidth / 2.0;	
	}
}

- (void)moveArrow:(BOOL)animated {
	
	if (animated) {
		[UIView beginAnimations:@"SlideAnimation" context:nil];
		[UIView setAnimationDuration:0.5];
		arrow.center = CGPointMake(pos, arrow.center.y);
		[UIView commitAnimations];
	} else {
		arrow.center = CGPointMake(pos, arrow.center.y);
	}
}

@end
