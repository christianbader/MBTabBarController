//
//  GradientView.m
//  MBTabBarController
//
//  Created by Christian Bader on 12/10/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

#import "GradientView.h"

@interface GradientView (PrivateMethods)

- (void)getColorComponents;

@end

@implementation GradientView

@synthesize tintColor;
@synthesize gradient;

#pragma mark -
#pragma mark Initialization and destruction

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
		// Black as default tint color
		tintColor = [UIColor blackColor];
		
		// Default draw a gradient
		self.gradient = YES;
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
	
	CGContextRef currentContext = UIGraphicsGetCurrentContext();
	
	[tintColor set];
	CGContextFillRect(currentContext, rect);
	

	if (gradient) {
		
		CGColorRef glossColor1 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.35].CGColor;
		CGColorRef glossColor2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1].CGColor;
		
		CGRect topHalf = CGRectMake(rect.origin.x, rect.origin.y, 
									rect.size.width, rect.size.height/2);
		
		drawLinearGradient(currentContext, topHalf, glossColor1, glossColor2);
	}
}

#pragma mark -
#pragma mark Accessor methods

- (UIColor *)tintColor {
	return tintColor;
}

- (void)setTintColor:(UIColor *)newValue {
	[tintColor autorelease];
	tintColor = [newValue retain];
	
	[self setNeedsDisplay];
}

- (void)setGradient:(BOOL)newValue {
	gradient = newValue;
	
	[self setNeedsDisplay];
}

#pragma mark -
#pragma mark Helper methods

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor) {
	
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = [NSArray arrayWithObjects:(id)startColor, (id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
}

@end
