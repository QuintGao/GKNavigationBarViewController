//
//  UINavigationItem+GKCategory.m
//  GKNavigationBarViewControllerTest
//
//  Created by QuintGao on 2017/10/13.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "UINavigationItem+GKCategory.h"
#import "GKCommon.h"
#import "GKNavigationBarConfigure.h"

@implementation UINavigationItem (GKCategory)

+ (void)load {
    // 保证其只执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        gk_swizzled_method(class, @selector(setLeftBarButtonItem:), @selector(gk_setLeftBarButtonItem:));

        gk_swizzled_method(class, @selector(setLeftBarButtonItems:), @selector(gk_setLeftBarButtonItems:));

        gk_swizzled_method(class, @selector(setRightBarButtonItem:), @selector(gk_setRightBarButtonItem:));

        gk_swizzled_method(class, @selector(setRightBarButtonItems:), @selector(gk_setRightBarButtonItems:));
    });
}

- (void)gk_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    if (GKDeviceVersion >= 11.0) {
        if (leftBarButtonItem.customView) {
            gk_tempFixSpace = 0;
            [self gk_setLeftBarButtonItem:leftBarButtonItem];
        }else {
            gk_tempFixSpace = 20;
            [self gk_setLeftBarButtonItem:leftBarButtonItem];
        }
    }else {
        if (leftBarButtonItem.customView) {
            [self gk_setLeftBarButtonItem:nil];
            [self setLeftBarButtonItems:@[leftBarButtonItem]];
        }else {
            [self setLeftBarButtonItems:nil];
            [self gk_setLeftBarButtonItem:leftBarButtonItem];
        }
    }
}

- (void)gk_setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)leftBarButtonItems {
    NSMutableArray *items = [NSMutableArray arrayWithObject:[self fixedSpaceWithWidth:GKConfigure.navItem_space - 20]]; // 修复iOS11之前的偏移

    [items addObjectsFromArray:leftBarButtonItems];

    [self gk_setLeftBarButtonItems:items];
}

- (void)gk_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem {
    if (GKDeviceVersion >= 11.0) {
        if (rightBarButtonItem.customView) {
            gk_tempFixSpace = 0;
            [self gk_setRightBarButtonItem:rightBarButtonItem];
        }else {
            gk_tempFixSpace = 20;
            [self gk_setRightBarButtonItem:rightBarButtonItem];
        }
    }else {
        if (rightBarButtonItem.customView) {
            [self gk_setRightBarButtonItem:nil];
            [self setRightBarButtonItems:@[rightBarButtonItem]];
        }else {
            [self setRightBarButtonItems:nil];
            [self gk_setRightBarButtonItem:rightBarButtonItem];
        }
    }
}

- (void)gk_setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)rightBarButtonItems {
    NSMutableArray *items = [NSMutableArray arrayWithObject:[self fixedSpaceWithWidth:GKConfigure.navItem_space - 20]]; // 可修正iOS11之前的偏移
    [items addObjectsFromArray:rightBarButtonItems];
    [self gk_setRightBarButtonItems:items];
}

- (UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width {
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpace.width = width;
    return fixedSpace;
}

@end
