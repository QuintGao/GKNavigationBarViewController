//
//  GKWBSubViewController.h
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/10/24.
//  Copyright © 2018 gaokun. All rights reserved.
//

#import <GKNavigationBarViewController/GKNavigationBarViewController.h>
#import "GKPageScrollView.h"
#import "JXPagerView/JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GKWBSubViewController : GKNavigationBarViewController<GKPageListScrollViewDelegate, JXPagerViewListViewDelegate>

@end

NS_ASSUME_NONNULL_END
