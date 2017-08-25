//
//  GKNavigationBarViewController.m
//  GKNavigationBarViewController
//
//  Created by QuintGao on 2017/7/7.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKNavigationBarViewController.h"
#import "GKNavigationBarConfigure.h"

#define GKSrcName(file) [@"GKNavigationBarViewController.bundle" stringByAppendingPathComponent:file]

#define GKFrameworkSrcName(file) [@"Frameworks/GKNavigationBarViewController.framework/GKNavigationBarViewController.bundle" stringByAppendingPathComponent:file]

#define GKImage(file)  [UIImage imageNamed:GKSrcName(file)] ? : [UIImage imageNamed:GKFrameworkSrcName(file)]

@interface GKNavigationBarViewController ()

@property (nonatomic, strong) UINavigationBar *gk_navigationBar;

@property (nonatomic, strong) UINavigationItem *gk_navigationItem;

@end

@implementation GKNavigationBarViewController

- (UINavigationBar *)gk_navigationBar {
    if (!_gk_navigationBar) {
        _gk_navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    }
    return _gk_navigationBar;
}

- (UINavigationItem *)gk_navigationItem {
    if (!_gk_navigationItem) {
        _gk_navigationItem = [UINavigationItem new];
    }
    return _gk_navigationItem;
}

//- (instancetype)init {
//    if (self = [super init]) {
//        // 设置自定义导航栏
//        [self setupCustomNavBar];
//        
//        // 设置导航栏外观
//        [self setupNavBarAppearance];
//    }
//    return self;
//}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        // 设置自定义导航栏
//        [self setupCustomNavBar];
//        
//        // 设置导航栏外观
//        [self setupNavBarAppearance];
//    }
//    return self;
//}

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        // 设置自定义导航栏
//        [self setupCustomNavBar];
//        
//        // 设置导航栏外观
//        [self setupNavBarAppearance];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置自定义导航栏
    [self setupCustomNavBar];
    
    // 设置导航栏外观
    [self setupNavBarAppearance];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.gk_navigationBar && !self.gk_navigationBar.hidden) {
        [self.view bringSubviewToFront:self.gk_navigationBar];
    }
}

/**
 设置自定义导航条
 */
- (void)setupCustomNavBar {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.gk_navigationBar];
    
//    self.gk_navigationBar.translucent = NO;
    
    self.gk_navigationBar.items = @[self.gk_navigationItem];
}

/**
 设置导航栏外观
 */
- (void)setupNavBarAppearance {
    
    GKNavigationBarConfigure *configure = [GKNavigationBarConfigure sharedInstance];
    
    if (configure.barTintColor) {
        self.gk_navBarTintColor = configure.barTintColor;
    }
    
    if (configure.tintColor) {
        self.gk_navTintColor = configure.tintColor;
    }
    
    if (configure.titleColor) {
        self.gk_navTitleColor = configure.titleColor;
    }
    
    if (configure.titleFont) {
        self.gk_navTitleFont = configure.titleFont;
    }
}

#pragma mark - setter
- (void)setTitle:(NSString *)title {
    self.gk_navigationItem.title = title;
}

- (void)setGk_navBarTintColor:(UIColor *)gk_navBarTintColor {
    _gk_navBarTintColor = gk_navBarTintColor;
    
    self.gk_navigationBar.barTintColor = gk_navBarTintColor;
}

- (void)setGk_navBackgroundColor:(UIColor *)gk_navBackgroundColor {
    _gk_navBackgroundColor = gk_navBackgroundColor;
    
    if (gk_navBackgroundColor == [UIColor clearColor]) {
        [self.gk_navigationBar setBackgroundImage:GKImage(@"transparent_bg") forBarMetrics:UIBarMetricsDefault];
        self.gk_navigationBar.shadowImage = [self imageWithColor:[UIColor clearColor]];
    }else {
        [self.gk_navigationBar setBackgroundImage:[self imageWithColor:gk_navBackgroundColor] forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)setGk_navBackgroundImage:(UIImage *)gk_navBackgroundImage {
    _gk_navBackgroundImage = gk_navBackgroundImage;
    
    [self.gk_navigationBar setBackgroundImage:gk_navBackgroundImage forBarMetrics:UIBarMetricsDefault];
}

- (void)setGk_navTintColor:(UIColor *)gk_navTintColor {
    _gk_navTintColor = gk_navTintColor;
    
    self.gk_navigationBar.tintColor = gk_navTintColor;
}

- (void)setGk_navTitleView:(UIView *)gk_navTitleView {
    _gk_navTitleView = gk_navTitleView;
    
    self.gk_navigationItem.titleView = gk_navTitleView;
}

- (void)setGk_navTitleColor:(UIColor *)gk_navTitleColor {
    _gk_navTitleColor = gk_navTitleColor;
    
    UIFont *titleFont = self.gk_navTitleFont ? self.gk_navTitleFont : [GKNavigationBarConfigure sharedInstance].titleFont;
    
    self.gk_navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: gk_navTitleColor, NSFontAttributeName: titleFont};
}

- (void)setGk_navTitleFont:(UIFont *)gk_navTitleFont {
    _gk_navTitleFont = gk_navTitleFont;
    
    UIColor *titleColor = self.gk_navTitleColor ? self.gk_navTitleColor : [GKNavigationBarConfigure sharedInstance].titleColor;
    
    self.gk_navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: titleColor, NSFontAttributeName: gk_navTitleFont};
}

- (void)setGk_navLeftBarButtonItem:(UIBarButtonItem *)gk_navLeftBarButtonItem {
    _gk_navLeftBarButtonItem = gk_navLeftBarButtonItem;
    
    self.gk_navigationItem.leftBarButtonItem = gk_navLeftBarButtonItem;
}

- (void)setGk_navLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)gk_navLeftBarButtonItems {
    _gk_navLeftBarButtonItems = gk_navLeftBarButtonItems;
    
    self.gk_navigationItem.leftBarButtonItems = gk_navLeftBarButtonItems;
}

- (void)setGk_navRightBarButtonItem:(UIBarButtonItem *)gk_navRightBarButtonItem {
    _gk_navRightBarButtonItem = gk_navRightBarButtonItem;
    
    self.gk_navigationItem.rightBarButtonItem = gk_navRightBarButtonItem;
}

- (void)setGk_navRightBarButtonItems:(NSArray<UIBarButtonItem *> *)gk_navRightBarButtonItems {
    _gk_navRightBarButtonItems = gk_navRightBarButtonItems;
    
    self.gk_navigationItem.rightBarButtonItems = gk_navRightBarButtonItems;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
