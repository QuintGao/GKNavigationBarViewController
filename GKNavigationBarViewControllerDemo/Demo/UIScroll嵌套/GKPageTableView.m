//
//  GKPageTableView.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/10/25.
//  Copyright © 2018 gaokun. All rights reserved.
//

#import "GKPageTableView.h"

@implementation GKPageTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
