//
//  GKPageScrollView.h
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/10/24.
//  Copyright © 2018 gaokun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GKPageScrollView;

@protocol GKPageListScrollViewDelegate <NSObject>

- (UIScrollView *)listScrollView;

/**
 listView滑动回调

 @param callBack 回调black
 */
- (void)listViewDidScrollCallback:(void (^)(UIScrollView *scrollView))callBack;

@end

@protocol GKPageScrollViewDelegate <NSObject>

@required
- (CGFloat)headerViewHeightInPageScrollView:(GKPageScrollView *)pageScrollView;

- (UIView *)headerViewInPageScrollView:(GKPageScrollView *)pageScrollView;;

- (UIView *)pageViewInPageScrollView:(GKPageScrollView *)pageScrollView;

- (NSArray <id<GKPageListScrollViewDelegate>> *)listViewsInPagerView:(GKPageScrollView *)pageScrollView;

@optional
- (void)mainTableViewDidScroll:(UIScrollView *)scrollView;

@end

@interface GKPageScrollView : UIView

- (instancetype)initWithDelegate:(id<GKPageScrollViewDelegate>)delegate;

@property (nonatomic, assign) id<GKPageScrollViewDelegate> delelgate;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
