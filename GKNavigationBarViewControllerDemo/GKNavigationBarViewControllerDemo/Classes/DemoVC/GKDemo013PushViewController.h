//
//  GKDemo013PushViewController.h
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2019/10/10.
//  Copyright © 2019 gaokun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKDemo013PushViewController : UITabBarController

- (instancetype)initWithScale:(BOOL)isScale;

@property (nonatomic, assign) BOOL isScale;

@end

NS_ASSUME_NONNULL_END
