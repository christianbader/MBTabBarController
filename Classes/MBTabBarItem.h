//
//  MBTabBarItem.h
//  MBTabBarController
//
//  Created by Christian Bader on 12/11/10.
//  Copyright 2010 MangoBits OG. All rights reserved.
//


@interface MBTabBarItem : UITabBarItem {

    UIImage *customSelectedImage;
    UIImage *customUnselectedImage;
}

@property (nonatomic, retain) UIImage *customSelectedImage;
@property (nonatomic, retain) UIImage *customUnselectedImage;

- (id)initWithTitle:(NSString *)title unselectedImage:(UIImage *)anUnselectedImage selectedImage:(UIImage *)aSelectedImage tag:(NSInteger)tag;

@end
