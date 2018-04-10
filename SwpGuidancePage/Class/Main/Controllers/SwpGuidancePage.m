//
//  SwpGuidancePage.m
//  swp_song
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpGuidancePage.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpGuidanceTools.h"            // 工具类
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpGuidanceCell.h"             // 引导页面 view
#import "SwpGuidanceCollectionView.h"
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpGuidanceModel.h"            // 引导页面 数据模型
/* ---------------------- View       ---------------------- */

@interface SwpGuidancePage ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* 显示引导 view   */
@property (nonatomic, strong) SwpGuidanceCollectionView *swpGuidanceCollectionView;
/* 显示分页 PageControl    */
@property (nonatomic, strong) UIPageControl              *swpGuidancePageControl;
/* 关闭按钮 */
@property (nonatomic, strong) UIButton                   *closeButton;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 图片模型数据源 !*/
@property (nonatomic, copy  ) NSArray *datas_;
/* 设置 SwpGuidancePage 是否开启 YES            */
@property (nonatomic, assign, getter = isSwpGuidancePageGlideGesture_)  BOOL swpGuidancePageGlideGesture_;
/* SwpGuidancePage 回调方法，滚动到最后一页调用  */
@property (nonatomic, copy, setter = swpGuidanceScrollLastPage:) void(^swpGuidanceScrollLastPage)(void);
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpGuidancePage

#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成 调用 )
 */
- (void)viewDidLoad {
    
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self setUI];
    
    [self setData];
    
    [self swpGuidancePageBlock];
    
}

/**
 *  @author swp_song
 *
 *  @brief  viewWillAppear: ( 将要加载出视图 调用)
 *
 *  @param  animated    animated
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  viewDidAppear: ( 视图 显示 窗口时 调用 )
 *
 *  @param  animated    animated
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief viewWillDisappear: ( 视图  即将消失、被覆盖或是隐藏时调用 )
 *
 *  @param animated animated
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // Do any additional setup after loading the view.
}

/**
 *  @author swp_song
 *
 *  @brief  viewDidDisappear: ( 视图已经消失、被覆盖或是隐藏时调用 )
 *
 *  @param  animated    animated
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  didReceiveMemoryWarning ( 内存不足时 调用 )
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  @author swp_song
 *
 *  @brief  dealloc ( 当前 控制器 被销毁时 调用 )
 */
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.closeButton.layer.cornerRadius     = self.closeButton.frame.size.height / 2.0;
    self.closeButton.layer.masksToBounds    = YES;
}


#pragma mark - Set Data Method
/**
 *  @author swp_song
 *
 *  @brief  setData ( 设置 初始化 数据 )
 */
- (void)setData {
    [self.closeButton addTarget:self action:@selector(clickButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Setting UI Methods
/**
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {
    [self setUpUI];
    [self setUIAutoLayout];
}

/**
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    [self.view addSubview:self.swpGuidanceCollectionView];
    [self.view addSubview:self.swpGuidancePageControl];
    [self.view addSubview:self.closeButton];
}


/**
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
    
    self.swpGuidanceCollectionView.frame = self.view.bounds;
    self.swpGuidancePageControl.frame    = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    
    CGSize  size            = [self.closeButton sizeThatFits:CGSizeZero];
    CGFloat width           = size.width + 20;
    self.closeButton.frame  = CGRectMake(self.view.frame.size.width - width - 20 , 50, width, size.height);
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageBlock    ( SwpGuidancePage Block )
 */
- (void)swpGuidancePageBlock {
    
    [self swpGuidanceCollectionViewBlock:self.swpGuidanceCollectionView];
}


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceCollectionViewBlock  ( SwpGuidanceCollectionView Block )
 *
 *  @param  swpGuidanceCollectionView   swpGuidanceCollectionView
 */
- (void)swpGuidanceCollectionViewBlock:(SwpGuidanceCollectionView *)swpGuidanceCollectionView {

    __weak typeof(self) weakSelf = self;
    
    //  分页
    swpGuidanceCollectionView.swpGuidanceScrollViewDidScrollChain(^(SwpGuidanceCollectionView *swpGuidanceCollectionView, UIScrollView *scrollView, NSInteger page){
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.swpGuidancePageControl.currentPage = page;
    });
    
    //  滑动隐藏
    swpGuidanceCollectionView.swpGuidanceScrollViewDidEndDraggingChain(^(SwpGuidanceCollectionView *swpGuidanceCollectionView, UIScrollView *scrollView, BOOL decelerate, BOOL isLastCell){
        
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        if (!strongSelf.swpGuidancePageGlideGesture_) return;
        
        if (decelerate || !isLastCell) return;
        
        [strongSelf swpGuidancePageHidden];
    });
}

/**
 *  @author swp_song
 *
 *  @brief  clickButtonEvent:   ( 按钮绑定方法 )
 *
 *  @param  button  button
 */
- (void)clickButtonEvent:(UIButton *)button {
    [self swpGuidancePageHidden];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageHidden:  ( 隐藏 swpGuidancePage )
 */
- (void)swpGuidancePageHidden {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        if (self.swpGuidanceScrollLastPage) self.swpGuidanceScrollLastPage();
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageShow:rootViewController:isSaveVersion:   ( 显示 SwpGuidancePage 判断版本，是否相同 )
 *
 *  @param  window          window
 *
 *  @param  viewController  viewController
 *
 *  @param  isSaveVersion   isSaveVersion
 *
 *  @param  sameVersion     sameVersion
 *
 *  @return SwpGuidancePage
 */
- (instancetype)swpGuidancePageShow:(UIWindow *)window rootViewController:(UIViewController *)viewController isSaveVersion:(BOOL)isSaveVersion sameVersion:(void(^)(void))sameVersion {
    
    [SwpGuidanceTools swpGuidanceToolsCheckAppVersion:^(NSString * _Nonnull version) {
        if (sameVersion) sameVersion();
        if (!viewController) return;
        window.rootViewController = viewController;
    } appVersionNotSame:^(NSString * _Nonnull appVersion, NSString * _Nonnull oldVersion) {
        window.rootViewController = self;
        return isSaveVersion;
    }];
    return self;
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageInfo ( 读取 SwpGuidancePage 信息资源文件 )
 *
 *  @return NSDictionary
 */
- (NSDictionary *)swpGuidancePageInfo {
    return [SwpGuidanceTools swpGuidanceToolsReadInfo];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageVersion  ( 读取 SwpGuidancePage 版本号 )
 *
 *  @return NSString
 */
- (NSString *)swpGuidancePageVersion {
    return [SwpGuidanceTools swpGuidanceToolsReadVersion];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageCheckAppVersion:appVersionSame:appVersionNotSame:    ( 验证 App 版本是否相同，是否保存版本号 )
 *
 *  @param  appVersionSame      appVersionSame
 *
 *  @param  appVersionNotSame   appVersionNotSame
 */
+ (void)swpGuidancePageCheckAppVersion:(void(^)(NSString *version))appVersionSame appVersionNotSame:(BOOL (^)(NSString *appVersion, NSString *oldVersion))appVersionNotSame {
    
    [SwpGuidanceTools swpGuidanceToolsCheckAppVersion:^(NSString * _Nonnull version) {
        if (appVersionSame) appVersionSame(version);
    } appVersionNotSame:^(NSString * _Nonnull appVersion, NSString * _Nonnull oldVersion) {
        if (appVersionNotSame) {
            return  appVersionNotSame(appVersion, oldVersion);
        }
        return NO;
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageShow:rootViewController:isSaveVersion:   ( 显示 SwpGuidancePage 判断版本，是否相同 )
 *
 *  @param  window          window
 *
 *  @param  viewController  viewController
 *
 *  @param  isSaveVersion   isSaveVersion
 *
 *  @return SwpGuidancePage
 */
- (instancetype)swpGuidancePageShow:(UIWindow *)window rootViewController:(UIViewController *)viewController isSaveVersion:(BOOL)isSaveVersion {
    return [self swpGuidancePageShow:window rootViewController:viewController isSaveVersion:isSaveVersion sameVersion:nil];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageShowChain    ( 显示 SwpGuidancePage 判断版本，是否相同 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(UIWindow * _Nonnull, UIViewController * _Nonnull, BOOL))swpGuidancePageShowChain {
    return ^(UIWindow *window, UIViewController *viewController, BOOL isSaveVersion) {
        return [self swpGuidancePageShow:window rootViewController:viewController isSaveVersion:isSaveVersion];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageShow:rootViewController:isSaveVersion:   ( 显示 SwpGuidancePage 判断版本，是否相同 )
 *
 *  @param  window          window
 *
 *  @param  isSaveVersion   isSaveVersion
 *
 *  @param  sameVersion     sameVersion
 *
 *  @return SwpGuidancePage
 */
- (instancetype)swpGuidancePageShow:(UIWindow *)window isSaveVersion:(BOOL)isSaveVersion sameVersion:(void(^)(void))sameVersion {
    return [self swpGuidancePageShow:window rootViewController:nil isSaveVersion:isSaveVersion sameVersion:sameVersion];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageShowSameVersionChain ( 显示 SwpGuidancePage 判断版本，是否相同 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(UIWindow * _Nonnull, BOOL, void (^ _Nonnull)(void)))swpGuidancePageShowSameVersionChain {
    return ^(UIWindow *window, BOOL isSaveVersion, void(^sameVersion)(void)) {
        return [self swpGuidancePageShow:window isSaveVersion:isSaveVersion sameVersion:sameVersion];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  datas   ( 设置数据源 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(NSArray * _Nonnull))datas {
    return ^(NSArray *datas) {
        self.datas_ = [SwpGuidanceModel swpGuidanceWithArray:datas];
        self.swpGuidancePageControl.numberOfPages = self.datas_.count;
        self.swpGuidanceCollectionView.datas(self.datas_);
        return self;
    };
}
/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageControlHidden:   ( 隐藏分页， YES = 隐藏 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(BOOL))swpGuidancePageControlHidden {
    return ^(BOOL hidden) {
        self.swpGuidancePageControl.hidden = hidden;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageGlideGesture ( 是否开启滑动关闭， YES = 开启， NO = 关闭， 默认关闭 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(BOOL))swpGuidancePageGlideGesture {
    return ^(BOOL pageGlideGesture) {
        self.swpGuidancePageGlideGesture_ = pageGlideGesture;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageNumberOfPagesColor   ( 设置总页数的颜色 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(UIColor * _Nonnull))swpGuidancePageNumberOfPagesColor {
    
    return ^(UIColor *color) {
        self.swpGuidancePageControl.pageIndicatorTintColor = color;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageCurrentPageColor ( 设置分页数的颜色 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(UIColor * _Nonnull))swpGuidancePageCurrentPageColor {
    return ^(UIColor *color) {
        self.swpGuidancePageControl.currentPageIndicatorTintColor = color;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollLastPage:  ( SwpGuidancePage 回调方法，滚动到最后一页调用 )
 *
 *  @param  swpGuidanceScrollLastPage   swpGuidanceScrollLastPage
 */
- (void)swpGuidanceScrollLastPage:(void (^)(void))swpGuidanceScrollLastPage {
    _swpGuidanceScrollLastPage = swpGuidanceScrollLastPage;
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollLastPageChain  ( SwpGuidancePage 回调方法，滚动到最后一页调用 )
 */
- (__kindof SwpGuidancePage * _Nonnull (^)(void (^)(void)))swpGuidanceScrollLastPageChain {
    return ^(void(^swpGuidanceScrollLastPage)(void)) {
        self.swpGuidanceScrollLastPage = swpGuidanceScrollLastPage;
        return self;
    };
}

#pragma mark - Init Data Methods

- (SwpGuidanceCollectionView *)swpGuidanceCollectionView {
    return !_swpGuidanceCollectionView ? _swpGuidanceCollectionView = ({
        SwpGuidanceCollectionView *swpGuidanceCollectionView = [SwpGuidanceCollectionView new];
        swpGuidanceCollectionView;
    }) : _swpGuidanceCollectionView;
}

- (UIPageControl *)swpGuidancePageControl {

    return !_swpGuidancePageControl ? _swpGuidancePageControl = ({
        UIPageControl *pageControl = [UIPageControl new];
        pageControl.pageIndicatorTintColor        = [UIColor redColor];
        pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        pageControl;
    }) : _swpGuidancePageControl;
}

- (UIButton *)closeButton {
    
    return !_closeButton ? _closeButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"跳过" forState:UIControlStateNormal];
        button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button;
    }) : _closeButton;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
