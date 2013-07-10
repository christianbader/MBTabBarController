    //
//  ConfigurationViewController.m
//  MBTabBarController
//
//  Created by Christian Bader on 12/12/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

#import "ConfigurationViewController.h"
#import "MBTabBarController.h"

@implementation ConfigurationViewController

#pragma mark -
#pragma mark Initialization and destruction

- (void)dealloc {
	[redSlider release];
	[greenSlider release];
	[blueSlider release];
    [super dealloc];
}

#pragma mark -
#pragma mark View handling

- (void)loadView {

	UIView *rootView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	rootView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	rootView.backgroundColor = [UIColor grayColor];

	redSlider = [[UISlider alloc] initWithFrame:CGRectMake(20.0, 60.0, rootView.frame.size.width - 40.0, 20.0)];
	redSlider.tag = 0;
	[redSlider setMinimumValue:0.0];
	[redSlider setMaximumValue:1.0];
	[redSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
	redSlider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[rootView addSubview:redSlider];

	greenSlider = [[UISlider alloc] initWithFrame:CGRectMake(20.0, 100.0, rootView.frame.size.width - 40.0, 20.0)];
	greenSlider.tag = 1;
	[greenSlider setMinimumValue:0.0];
	[greenSlider setMaximumValue:1.0];
	[greenSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
	greenSlider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[rootView addSubview:greenSlider];

	blueSlider = [[UISlider alloc] initWithFrame:CGRectMake(20.0, 140.0, rootView.frame.size.width - 40.0, 20.0)];
	blueSlider.tag = 2;
	[blueSlider setMinimumValue:0.0];
	[blueSlider setMaximumValue:1.0];
	[blueSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
	blueSlider.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[rootView addSubview:blueSlider];

	UISwitch *gradientSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20.0, 200.0, 60.0, 20.0)];
	[gradientSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
	[rootView addSubview:gradientSwitch];
	[gradientSwitch release];

	self.view = rootView;
	[rootView release];
}

#pragma mark -
#pragma mark Action methods

- (void)valueChanged:(id)sender {

	UIColor *color = [UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0];
	[(MBTabBarController *)self.tabBarController setTabBarTintColor:color];
}

- (void)switchChanged:(UISwitch *)sender {
	[(MBTabBarController *)self.tabBarController setTabBarGradient:sender.on];
}

#pragma mark -
#pragma mark Rotation hadling

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {

	return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
			toInterfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
