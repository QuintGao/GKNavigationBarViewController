//
//  GKTabBaseViewController.h
//  GKNavigationControllerDemo
//
//  Created by QuintGao on 2017/6/25.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKNavigationBarViewController.h"

@interface GKTabBaseViewController : GKNavigationBarViewController

@property (nonatomic, assign) BOOL  isScale;

@property (nonatomic, copy) NSString *contentText;

- (void)showBackBtn;

- (void)pushAction;

@end
