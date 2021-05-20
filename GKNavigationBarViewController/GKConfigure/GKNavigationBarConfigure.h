//
//  GKNavigationBarConfigure.h
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/10.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKCommon.h"

@interface GKNavigationBarConfigure : NSObject

/// 导航栏背景色，默认白色
@property (nonatomic, strong) UIColor *backgroundColor;

/// 导航栏标题颜色，默认黑色
@property (nonatomic, strong) UIColor *titleColor;

/// 导航栏标题字体，默认系统字体17
@property (nonatomic, strong) UIFont *titleFont;

/// 返回按钮图片，默认nil，优先级高于backStyle
@property (nonatomic, strong) UIImage *backImage;

/// 返回按钮样式，默认GKNavigationBarBackStyleBlack
@property (nonatomic, assign) GKNavigationBarBackStyle backStyle;

/// 是否禁止导航栏左右item调整间距，默认NO
@property (nonatomic, assign) BOOL      gk_disableFixSpace;

/// 导航栏左右按钮距屏幕左边间距，默认是0，可自行调整
@property (nonatomic, assign) CGFloat   gk_navItemLeftSpace;

/// 导航栏左右按钮距屏幕右边间距，默认是0，可自行调整
@property (nonatomic, assign) CGFloat   gk_navItemRightSpace;

/// 是否隐藏状态栏，默认NO
@property (nonatomic, assign) BOOL statusBarHidden;

/// 状态栏类型，默认UIStatusBarStyleDefault
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/// 快速滑动时的敏感度，默认0.7
@property (nonatomic, assign) CGFloat   gk_snapMovementSensitivity;

/// 左滑push过渡临界值，默认0.3，大于此值完成push操作
@property (nonatomic, assign) CGFloat   gk_pushTransitionCriticalValue;

/// 右滑pop过渡临界值，默认0.5，大于此值完成pop操作
@property (nonatomic, assign) CGFloat   gk_popTransitionCriticalValue;

// 以下属性需要设置导航栏转场缩放为YES
// 手机系统大于等于11.0，使用下面的值控制x、y轴的位移距离，默认（5，5）
@property (nonatomic, assign) CGFloat   gk_translationX;
@property (nonatomic, assign) CGFloat   gk_translationY;

// 手机系统小于11.0，使用下面的值控制x、y轴的缩放程度，默认（0.95，0.97）
@property (nonatomic, assign) CGFloat   gk_scaleX;
@property (nonatomic, assign) CGFloat   gk_scaleY;

// 调整导航栏间距时需要屏蔽的VC（默认nil），支持Class和NSString
@property (nonatomic, strong) NSArray *shiledItemSpaceVCs;

// 需要屏蔽手势处理的VC（默认nil），支持Class和NSString
@property (nonatomic, strong) NSArray *shiledGuestureVCs;

// 全局开启UIScrollView手势处理，默认NO
// 如果设置为YES，所有UIScrollView都开启手势处理功能，可在单个UIScrollView中通过设置gk_openGestureHandle关闭
@property (nonatomic, assign) BOOL gk_openScrollViewGestureHandle;

/// 导航栏左右间距，内部使用
@property (nonatomic, assign, readonly) CGFloat navItemLeftSpace;
@property (nonatomic, assign, readonly) CGFloat navItemRightSpace;

/// 单例，设置一次全局使用
+ (instancetype)sharedInstance;

// 统一配置导航栏外观，最好在AppDelegate中配置
- (void)setupDefaultConfigure;

/// 设置自定义配置，此方法只需调用一次
/// @param block 配置回调
- (void)setupCustomConfigure:(void (^)(GKNavigationBarConfigure *configure))block;

/// 更新配置
/// @param block 配置回调
- (void)updateConfigure:(void (^)(GKNavigationBarConfigure *configure))block;

/// 获取APP当前最顶层的可见viewController
- (UIViewController *)visibleViewController;

#pragma mark - 内部方法
/// 获取当前item修复间距
- (CGFloat)gk_fixedSpace;

/// 获取bundle
- (NSBundle *)gk_libraryBundle;

/// 判断当前速度是是否在敏感度范围
/// @param velocity 速度
- (BOOL)isVelocityInSensitivity:(CGFloat)velocity;

@end

// from QMUI
@interface GKNavigationBarConfigure (UIDevice)

@property (class, nonatomic, readonly) BOOL isIPad;
@property (class, nonatomic, readonly) BOOL isIPod;
@property (class, nonatomic, readonly) BOOL isIPhone;
@property (class, nonatomic, readonly) BOOL isSimulator;
@property (class, nonatomic, readonly) BOOL isMac;

// 带物理凹槽的刘海屏或者使用 Home Indicator 类型的设备
@property (class, nonatomic, readonly) BOOL isNotchedScreen;

// 将屏幕分为普通和紧凑两种，这个方法用于判断普通屏幕（也即大屏幕）
@property (class, nonatomic, readonly) BOOL isRegularScreen;

/// iPhone 12 Pro Max
@property (class, nonatomic, readonly) BOOL is67InchScreen;

/// iPhone XS Max / 11 Pro Max
@property (class, nonatomic, readonly) BOOL is65InchScreen;

/// iPhone 12 / 12 Pro
@property (class, nonatomic, readonly) BOOL is61InchScreenAndiPhone12;

/// iPhone XR / 11
@property (class, nonatomic, readonly) BOOL is61InchScreen;

/// iPhone X / XS / 11Pro
@property (class, nonatomic, readonly) BOOL is58InchScreen;

/// iPhone 6，6s，7，8 Plus
@property (class, nonatomic, readonly) BOOL is55InchScreen;

/// iPhone 12 mini
@property (class, nonatomic, readonly) BOOL is54InchScreen;

/// iPhone 6，6s，7，8，SE2
@property (class, nonatomic, readonly) BOOL is47InchScreen;

/// iPhone 5，5s，5c，SE
@property (class, nonatomic, readonly) BOOL is40InchScreen;

/// iPhone 4
@property (class, nonatomic, readonly) BOOL is35InchScreen;

@property (class, nonatomic, readonly) CGSize screenSizeFor67Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor65Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor61InchAndiPhone12;
@property (class, nonatomic, readonly) CGSize screenSizeFor61Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor58Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor55Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor54Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor47Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor40Inch;
@property (class, nonatomic, readonly) CGSize screenSizeFor35Inch;

// 导航栏高度，包括竖屏，横屏，放大模式，非全屏模式
// 机型\高度         尺寸        竖屏       横屏      放大模式    非全屏模式
// 5,5s,5c,SE       4.0        44        32         不支持       56
// 6,6s,7,8,SE2     4.7        44        32          32         56
// 6,6s,7,8plus     5.5        44        44          32         56
// X,XS,11Pro       5.8        44        32          32         56
// XR,11            6.1        44        44          32         56
// XS MAX,11Pro Max 6.5        44        44          32         56
// 12mini           5.4        44        32          32         56
// 12,12Pro         6.1        44        32          32         56
// 12Pro Max        6.7        44        44          32         56
// iPad iOS12之前是44，之后是50
@property (class, nonatomic, readonly) CGFloat      navBarHeight;
@property (class, nonatomic, readonly) CGFloat      navBarHeight_nonFullScreen;
@property (class, nonatomic, readonly) CGFloat      tabBarHeight;
@property (class, nonatomic, readonly) UIEdgeInsets safeAreaInsets;
@property (class, nonatomic, readonly) CGRect       statusBarFrame;
@property (class, nonatomic, readonly) UIWindow     *keyWindow;

// 用于获取 isNotchedScreen 设备的 insets，注意对于 iPad Pro 11-inch 这种无刘海凹槽但却有使用 Home Indicator 的设备，它的 top 返回0，bottom 返回 safeAreaInsets.bottom 的值
+ (UIEdgeInsets)safeAreaInsetsForDeviceWithNotch;

@end
