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
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpGuidanceModel.h"            // 引导页面 数据模型
/* ---------------------- View       ---------------------- */


static NSString * const kSwpGuidanceCellID = @"kSwpGuidanceCellID";

@interface SwpGuidancePage () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, SwpGuidanceCellDelegate>

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- !*/
@property (nonatomic, strong) UICollectionView           *swpGuidanceCollectionView;
/* UICollectionView 瀑布流 !*/
@property (nonatomic, strong) UICollectionViewFlowLayout *swpGuidanceFlowLayout;
/* 显示分页 PageControl    !*/
@property (nonatomic, strong) UIPageControl              *swpGuidancePageControl;
/** ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- !*/
/* 图片轮播数据源 !*/
@property (nonatomic, copy  ) NSArray       *swpGuidanceDataSource;
/* 图片模型数据源 !*/
@property (nonatomic, copy  ) NSArray       *swpGuidanceModelDataSource;
/* 记录cell索引   !*/
@property (nonatomic, copy  ) NSIndexPath   *indexPath;
/*    */
@property (nonatomic, copy, setter = swpGuidanceLastCell:) void(^swpGuidanceLastCell)(void);
/* ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpGuidancePage

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceWithDataSource:  (  快速 初始化 SwpGuidancePage )
 *
 *  @param  dataSource  dataSource
 *
 *  @return SwpGuidancePage
 */
+ (instancetype)swpGuidanceWithDataSource:(NSArray *)dataSource {
    return [[self alloc] initWithDataSource:dataSource];
}

/**
 *  @author swp_song
 *
 *  @brief  initWithDataSource: ( 初始化 SwpGuidancePage )
 *
 *  @param  dataSource  dataSource
 *
 *  @return SwpGuidancePage
 */
- (instancetype)initWithDataSource:(NSArray *)dataSource {

    if (self = [super init]) {
        self.swpGuidanceDataSource = dataSource;
    }
    return self;
}



#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成 调用 )
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    [self setUI];
    [self setData];
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


#pragma mark - Set Data Method
/**
 *  @author swp_song
 *
 *  @brief  setData ( 设置 初始化 数据 )
 */
- (void)setData {
    self.swpGuidanceModelDataSource           = [SwpGuidanceModel swpGuidanceWithArray:self.swpGuidanceDataSource];
    self.swpGuidancePageControl.numberOfPages = self.swpGuidanceModelDataSource.count;
    self.swpGuidancePageControlHidden         = NO;
    self.swpGuidancePageGlideGesture          = YES;
    self.swpGuidancePageNumberOfPagesColor    = nil;
    self.swpGuidancePageCurrentPageColor      = nil;
}

#pragma mark - Setting UI Methods
/**
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {
    [self setUpUI];
}

/**
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    [self.view addSubview:self.swpGuidanceCollectionView];
    [self.view addSubview:self.swpGuidancePageControl];
}

#pragma mark - UICollectionView DataSoure Methods
/**
 *  @author swp_song
 *
 *  @brief  numberOfSectionsInCollectionView:   ( UICollectionView 数据源方法，设置 collectionView 分组个数 )
 *
 *  @param  collectionView  collectionView
 *
 *  @return NSInteger       NSInteger
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:numberOfItemsInSection:  ( UICollectionView 数据源方法，设置 collectionView 分组中 Cell 显示的个数 )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  section         section
 *
 *  @return NSInteger       NSInteger
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.swpGuidanceModelDataSource.count;
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:cellForItemAtIndexPath:  ( UICollectionView 数据源方法，设置 collectionView 分组中 Cell 显示的数据 | 样式 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  indexPath               indexPath
 *
 *  @return UICollectionViewCell    UICollectionViewCell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    self.indexPath                        = indexPath;
    SwpGuidanceCell *cell   = [SwpGuidanceCell swpGuidanceCellWithCollectionView:collectionView reuseIdentifier:kSwpGuidanceCellID forIndexPath:indexPath];
    cell.delegate                         = self;
    cell.swpGuidance                      = self.swpGuidanceModelDataSource[indexPath.item];
    cell.swpGuidanceButtonBackgroundColor = self.swpGuidancePageButtonBackgroundColor;
    cell.swpGuidanceButtonTextColor       = self.swpGuidancePageButtonTextColor;
    cell.swpGuidanceButtonText            = self.swpGuidancePageButtonText;
    return cell;
}

#pragma mark - UICollectionView Delegate Methods
/**
 *  @author swp_song
 *
 *  @brief  collectionView:layout:sizeForItemAtIndexPath:   ( UICollectionView 代理方法，设置 collectionView  每个 Cell 的 size )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  indexPath               indexPath
 *
 *  @return CGSize
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.swpGuidanceCollectionView.frame.size;
}

#pragma mark - ScrollView Delegate Methods
/**
 *  @author swp_song
 *
 *  @brief  scrollViewDidScroll:    ( UIScrollView 代理方法，开始拖动时候调用 < 计算分页 >  )
 *
 *  @param  scrollView  scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 精确分页
    NSInteger page = 0;
    if (self.swpGuidanceFlowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        page = (scrollView.contentOffset.x + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
    } else {
        page = (scrollView.contentOffset.y + scrollView.frame.size.height * 0.5) / scrollView.frame.size.height;
    }
    
    self.swpGuidancePageControl.currentPage = page;
}

/**
 *  @author swp_song
 *
 *  @brief  scrollViewDidEndDragging:willDecelerate:    ( UIScrollView 代理方法，停止拖动时调用  )
 *
 *  @param  scrollView  scrollView
 *
 *  @param  decelerate  decelerate
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
    if (!self.swpGuidancePageGlideGesture) return;
    if (!decelerate) {
        __weak typeof(self) selfController = self;
        [SwpGuidanceTools swpGuidanceToolsCheckSwpGuidanceLastCell:self.indexPath index:self.swpGuidanceDataSource.count - 1 checkSuccess:^{
            [selfController swpGuidancePageHidden];
        } checkError:nil];
        
    }
}

#pragma mark - SwpGuidanceCell Delegate Methods
/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellClickButton: ( SwpGuidanceCell 代理方法，点击 Button 调用 )
 *
 *  @param  swpGuidanceCell swpGuidanceCell
 */
- (void)swpGuidanceCellClickButton:(SwpGuidanceCell *)swpGuidanceCell {
    [self swpGuidancePageHidden];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidancePageHidden:  ( 隐藏 swpGuidancePage )
 */
- (void)swpGuidancePageHidden {
    __weak typeof(self) selfController = self;
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        if (selfController.swpGuidanceLastCell) selfController.swpGuidanceLastCell();
    }];
}

#pragma mark - Public Methods

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceLastCell: ( SwpGuidancePage 回调方法，滑动最后一个 Cell 调用 )
 *
 *  @param  swpGuidanceLastCell swpGuidanceLastCell
 */
- (void)swpGuidanceLastCell:(void (^)(void))swpGuidanceLastCell {
    _swpGuidanceLastCell = swpGuidanceLastCell;
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
        return YES;
    }];

}

#pragma mark - Init Data Methods
- (UICollectionView *)swpGuidanceCollectionView {

    if (!_swpGuidanceCollectionView) {

        _swpGuidanceCollectionView                                = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.swpGuidanceFlowLayout];
        [_swpGuidanceCollectionView registerClass:[SwpGuidanceCell class] forCellWithReuseIdentifier:kSwpGuidanceCellID];
        _swpGuidanceCollectionView.backgroundColor                = [UIColor whiteColor];
        _swpGuidanceCollectionView.dataSource                     = self;
        _swpGuidanceCollectionView.delegate                       = self;
        _swpGuidanceCollectionView.pagingEnabled                  = YES;
        _swpGuidanceCollectionView.showsHorizontalScrollIndicator = NO;
        _swpGuidanceCollectionView.showsVerticalScrollIndicator   = NO;
        _swpGuidanceCollectionView.bounces                        = NO;
    }
    return _swpGuidanceCollectionView;
}

- (UICollectionViewFlowLayout *)swpGuidanceFlowLayout {

    if (!_swpGuidanceFlowLayout) {
        _swpGuidanceFlowLayout                         = [[UICollectionViewFlowLayout alloc] init];
        // 横向滚动
        _swpGuidanceFlowLayout.scrollDirection         = UICollectionViewScrollDirectionHorizontal;
        _swpGuidanceFlowLayout.minimumLineSpacing      = 0;
        _swpGuidanceFlowLayout.minimumInteritemSpacing = 0;
    }
    return _swpGuidanceFlowLayout;
}

- (UIPageControl *)swpGuidancePageControl {

    if (!_swpGuidancePageControl) {
        _swpGuidancePageControl                               = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
        _swpGuidancePageControl.enabled                       = NO;
        _swpGuidancePageControl.hidden                        = self.swpGuidancePageControlHidden;
        _swpGuidancePageControl.pageIndicatorTintColor        = self.swpGuidancePageNumberOfPagesColor;
        _swpGuidancePageControl.currentPageIndicatorTintColor = self.swpGuidancePageCurrentPageColor;
    }
    return _swpGuidancePageControl;
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
