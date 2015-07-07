//
//  SKViewController.h
//  Score Keeper
//
//  Created by Robert Shepperd on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKViewController : UIViewController

@property (nonatomic) UIScrollView *scrollView;
- (void) addScoreView:(int)n;

@end
