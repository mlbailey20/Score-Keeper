//
//  SKViewController.h
//  Score Keeper
//
//  Created by Robert Shepperd on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKViewController : UIViewController
@property (nonatomic, readwrite) NSMutableArray  *_scoreLabels;
@property (nonatomic, readwrite) NSMutableArray *_scoreViews;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIButton *addScore;
@property (nonatomic) UIButton *removeScore;
- (void) addScoreView:(id)sender;
- (void) removeLastScore:(id)sender;
- (void) updateButtonView;

@end
