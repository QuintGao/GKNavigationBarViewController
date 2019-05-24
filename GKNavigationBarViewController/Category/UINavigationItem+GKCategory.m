//
//  UINavigationItem+GKCategory.m
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/10/13.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "UINavigationItem+GKCategory.h"
#import "GKCommon.h"
#import "GKNavigationBarConfigure.h"

@implementation UINavigationItem (GKCategory)

+ (void)load {
    if (@available(iOS 11.0, *)) {} else {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSArray <NSString *>*oriSels = @[@"setLeftBarButtonItem:",
                                             @"setLeftBarButtonItem:animated:",
                                             @"setLeftBarButtonItems:",
                                             @"setLeftBarButtonItems:animated:",
                                             @"setRightBarButtonItem:",
                                             @"setRightBarButtonItem:animated:",
                                             @"setRightBarButtonItems:",
                                             @"setRightBarButtonItems:animated:"];
            
            [oriSels enumerateObjectsUsingBlock:^(NSString * _Nonnull oriSel, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *swiSel = [NSString stringWithFormat:@"gk_%@", oriSel];
                gk_swizzled_method([self class], NSSelectorFromString(oriSel), NSSelectorFromString(swiSel));
            }];
        });
    }
}

- (void)gk_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    [self setLeftBarButtonItem:leftBarButtonItem animated:NO];
}

- (void)gk_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem animated:(BOOL)animated {
    if (!GKConfigure.gk_disableFixSpace && leftBarButtonItem) {//存在按钮且需要调节
        [self setLeftBarButtonItems:@[leftBarButtonItem] animated:animated];
    } else {//不存在按钮,或者不需要调节
        [self gk_setLeftBarButtonItem:leftBarButtonItem animated:animated];
    }
}


- (void)gk_setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)leftBarButtonItems {
    [self setLeftBarButtonItems:leftBarButtonItems animated:NO];
}

- (void)gk_setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)leftBarButtonItems animated:(BOOL)animated {
    if (!GKConfigure.gk_disableFixSpace && leftBarButtonItems.count) {//存在按钮且需要调节
        UIBarButtonItem *firstItem = leftBarButtonItems.firstObject;
        CGFloat width = GKConfigure.gk_navItemLeftSpace - self.fixedSpace;
        if (firstItem.width == width) {//已经存在space
            [self gk_setLeftBarButtonItems:leftBarButtonItems animated:animated];
        } else {
            NSMutableArray *items = [NSMutableArray arrayWithArray:leftBarButtonItems];
            [items insertObject:[self fixedSpaceWithWidth:width] atIndex:0];
            [self gk_setLeftBarButtonItems:items animated:animated];
        }
    } else {//不存在按钮,或者不需要调节
        [self gk_setLeftBarButtonItems:leftBarButtonItems animated:animated];
    }
}

- (void)gk_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem{
    [self setRightBarButtonItem:rightBarButtonItem animated:NO];
}

- (void)gk_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem animated:(BOOL)animated {
    if (!GKConfigure.gk_disableFixSpace && rightBarButtonItem) {//存在按钮且需要调节
        [self setRightBarButtonItems:@[rightBarButtonItem] animated:animated];
    } else {//不存在按钮,或者不需要调节
        [self gk_setRightBarButtonItem:rightBarButtonItem animated:animated];
    }
}

- (void)gk_setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)rightBarButtonItems{
    [self setRightBarButtonItems:rightBarButtonItems animated:NO];
}

- (void)gk_setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)rightBarButtonItems animated:(BOOL)animated {
    if (!GKConfigure.gk_disableFixSpace && rightBarButtonItems.count) {//存在按钮且需要调节
        UIBarButtonItem *firstItem = rightBarButtonItems.firstObject;
        CGFloat width = GKConfigure.gk_navItemRightSpace - self.fixedSpace;
        if (firstItem.width == width) {//已经存在space
            [self gk_setRightBarButtonItems:rightBarButtonItems animated:animated];
        } else {
            NSMutableArray *items = [NSMutableArray arrayWithArray:rightBarButtonItems];
            [items insertObject:[self fixedSpaceWithWidth:width] atIndex:0];
            [self gk_setRightBarButtonItems:items animated:animated];
        }
    } else {//不存在按钮,或者不需要调节
        [self gk_setRightBarButtonItems:rightBarButtonItems animated:animated];
    }
}

- (UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width {
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpace.width = width;
    return fixedSpace;
}

- (CGFloat)fixedSpace {
    CGSize screentSize = [UIScreen mainScreen].bounds.size;
    return MIN(screentSize.width, screentSize.height) > 375 ? 20 : 16;
}

@end
