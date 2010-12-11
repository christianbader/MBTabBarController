//
//  MBTabBarItem.m
//  MBTabBarController
//
//  Created by Christian Bader on 12/11/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//

#import "MBTabBarItem.h"


@implementation MBTabBarItem

@synthesize customSelectedImage;
@synthesize customUnselectedImage;

#pragma mark -
#pragma mark Initialization and destruction

// Designated Initializer
- (id)initWithTitle:(NSString *)title unselectedImage:(UIImage *)anUnselectedImage selectedImage:(UIImage *)aSelectedImage tag:(NSInteger)tag {
	
	self.customSelectedImage = aSelectedImage;
	
	return [self initWithTitle:title image:anUnselectedImage tag:tag];
}
	
- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag {

	if (self = [super initWithTitle:title image:image tag:tag]) {
		self.customUnselectedImage = image;
	}
	return self;
}

- (void)dealloc {
    [customSelectedImage release];
    [customUnselectedImage release];   
    [super dealloc];
}

#pragma mark -
#pragma mark Overwritten methods

-(UIImage *)selectedImage {
    return self.customSelectedImage;
}

-(UIImage *)unselectedImage {
    return self.customUnselectedImage;
}

@end
