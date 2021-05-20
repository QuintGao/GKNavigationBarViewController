//
//  UIBarButtonItem+GKCategory.m
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/7.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "UIBarButtonItem+GKCategory.h"
#import "UIImage+GKCategory.h"

@implementation UIBarButtonItem (GKCategory)

+ (instancetype)itemWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)target action:(SEL)action {
    UIImage *image = imageName.length > 0 ? [UIImage gk_imageNamed:imageName] : nil;
    return [self itemWithTitle:title image:image highLightImage:nil target:target action:action];
}

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action {
    return [self itemWithTitle:title image:image highLightImage:nil target:target action:action];
}

+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    UIImage *image = imageName.length > 0 ? [UIImage gk_imageNamed:imageName] : nil;
    return [self itemWithTitle:nil image:image highLightImage:nil target:target action:action];
}

+ (instancetype)itemWithImageName:(NSString *)imageName highLightImageName:(NSString *)highLightImageName target:(id)target action:(SEL)action {
    UIImage *image = imageName.length > 0 ? [UIImage gk_imageNamed:imageName] : nil;
    UIImage *highLightImage = highLightImageName.length > 0 ? [UIImage gk_imageNamed:highLightImageName] : nil;
    return [self itemWithTitle:nil image:image highLightImage:highLightImage target:target action:action];
}

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    return [self itemWithTitle:title image:nil highLightImage:nil target:target action:action];
}

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image highLightImage:(UIImage *)highLightImage target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton new];
    if (title) [btn setTitle:title forState:UIControlStateNormal];
    if (image) [btn setImage:image forState:UIControlStateNormal];
    if (highLightImage) [btn setImage:highLightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (btn.bounds.size.width < 44.0f) {
        btn.bounds = CGRectMake(0, 0, 44.0f, 44.0f);
    }
    return [[self alloc] initWithCustomView:btn];
}

@end
