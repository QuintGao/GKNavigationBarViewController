//
//  GKDemo001ViewController.m
//  GKNavigationController
//
//  Created by QuintGao on 2017/6/22.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKDemo001ViewController.h"

@interface GKDemo001ViewController()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *images;

@end

@implementation GKDemo001ViewController

- (NSArray *)images {
    if (!_images) {
        NSMutableArray *images = [NSMutableArray new];
        for (NSInteger i = 0; i < 7; i++) {
            NSString *imageName = [NSString stringWithFormat:@"00%zd", i + 1];
            
            [images addObject:[UIImage imageNamed:imageName]];
        }
        _images = [NSArray arrayWithArray:images];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)setupUI {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate        = self;
    self.scrollView.pagingEnabled   = YES;
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];
    
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    for (NSInteger i = 0; i < self.images.count; i++) {
        UIImageView *imageView = [UIImageView new];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
        imageView.image = self.images[i];
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentSize:CGSizeMake(self.images.count * scrollW, 0)];
}

@end
