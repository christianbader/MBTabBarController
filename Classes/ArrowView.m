//
//  ArrowView.m
//  MBTabBarController
//
//  Created by Christian Bader on 12/11/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

#import "ArrowView.h"

@implementation ArrowView

@synthesize tintColor;

#pragma mark -
#pragma mark Initialization and destruction

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		self.backgroundColor = [UIColor clearColor];
		self.tintColor = [UIColor blackColor];
    }
    return self;
}

- (void)dealloc {
	[tintColor release];
    [super dealloc];
}

#pragma mark -
#pragma mark Drawing methods

- (void)drawRect:(CGRect)rect {
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, tintColor.CGColor);
	
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, rect.size.width / 2, 0.0);
	CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
	CGContextAddLineToPoint(context, 0.0, rect.size.height);
	CGContextClosePath(context);
	CGContextFillPath(context);
	
	[[UIColor blackColor] set];
	CGContextSetLineWidth(context, 1.0);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, rect.size.width / 2, 0.0);
	CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
	CGContextStrokePath(context);
}

#pragma mark -
#pragma mark Accessor methods

- (UIColor *)tintColor {
	return tintColor;
}

- (void)setTintColor:(UIColor *)newValue {
	[tintColor autorelease];
	tintColor = [newValue retain];
	
	[self setNeedsLayout];
}

@end
