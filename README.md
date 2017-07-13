## GKNavigationBarViewController --- iOS自定义导航栏-导航栏联动（二）

## 导航栏联动的实现方法
  [iOS自定义导航栏-导航栏联动（一）](https://github.com/QuintGao/GKNavigationController)

  [iOS自定义导航栏-导航栏联动（二）](https://github.com/QuintGao/GKNavigationBarViewController)

## 说明：

现在大多数的APP都有导航栏联动效果，即滑动返回的时候导航栏也跟着一起返回，比如：网易新闻，网易云音乐，腾讯视频等等，于是通过查找一些资料及其他库的做法，自己也写了一个框架，可以让每一个控制器都拥有自己的导航栏，可以很方便的改变导航栏的样式等

## 介绍：(本框架的特性)

    * 支持自定义导航栏样式（隐藏、透明等）
    * 支持控制器开关返回手势
    * 支持控制器开关全屏返回手势
    * 支持控制器设置导航栏透明度，可实现渐变效果
    * 完美解决UITableView，UIScrollView滑动手势冲突
    * 可实现push，pop时控制器缩放效果（如：今日头条）
    * 可实现左滑push一个控制器的效果（如：网易新闻）

## Demo中部分截图如下

![今日头条](https://github.com/QuintGao/GKNavigationBarViewController/blob/master/GKNavigationBarViewControllerDemo/%E4%BB%8A%E6%97%A5%E5%A4%B4%E6%9D%A1.gif)

![网易云音乐](https://github.com/QuintGao/GKNavigationBarViewController/blob/master/GKNavigationBarViewControllerDemo/%E7%BD%91%E6%98%93%E4%BA%91%E9%9F%B3%E4%B9%90.gif)

![网易新闻](https://github.com/QuintGao/GKNavigationBarViewController/blob/master/GKNavigationBarViewControllerDemo/%E7%BD%91%E6%98%93%E6%96%B0%E9%97%BB.gif)

