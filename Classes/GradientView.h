//
//  GradientView.h
//  MBTabBarController
//
//  Created by Christian Bader on 12/10/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//


@interface GradientView : UIView {

	UIColor *tintColor;
	
	CGFloat components[8];
	
	BOOL gradient;
}

@property (nonatomic, retain) UIColor *tintColor;
@property (nonatomic, assign) BOOL gradient;

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor);
void drawTopLine(CGContextRef context, CGRect rect, CGColorRef color);

@end
