//
//  GKFloatTransition.h
//  GKNavigationBarViewControllerDemo
//
//  Created by QuintGao on 2020/10/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, GKFloatTransitionType) {
    GKFloatTransitionTypePush = 0,
    GKFloatTransitionTypePop  = 1
};

@interface GKFloatTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithType:(GKFloatTransitionType)type;

@end

NS_ASSUME_NONNULL_END
