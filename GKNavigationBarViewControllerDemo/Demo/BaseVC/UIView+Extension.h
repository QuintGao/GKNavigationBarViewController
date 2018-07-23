//
//  UIView+Extension.h
//
//
//  Created by Fire on 15/7/27.
//  Copyright (c) 2015年 Fire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (readonly) CGPoint origin;
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

+ (instancetype)viewFromeXib;

+ (instancetype)viewFromBgColor:(UIColor *)bgColor;

@end
