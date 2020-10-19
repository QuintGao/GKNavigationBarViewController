//
//  GKFloatTransition.h
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//

#import <UIKit/UIKit.h>
#import "GKBaseTransitionAnimation.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, GKFloatTransitionType) {
    GKFloatTransitionTypePush = 0,  // 圆放大
    GKFloatTransitionTypePop  = 1,  // 圆缩小
};

@interface GKFloatTransition : GKBaseTransitionAnimation

+ (instancetype)transitionWithType:(GKFloatTransitionType)type;

@end

NS_ASSUME_NONNULL_END
