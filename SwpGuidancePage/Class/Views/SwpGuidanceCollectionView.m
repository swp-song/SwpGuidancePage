//
//  SwpGuidanceCollectionView.m
//  swp_song
//
//  Created by swp_song on 2017/12/14.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpGuidanceCollectionView.h"


/* ---------------------- Tool       ---------------------- */

/* ---------------------- Tool       ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpGuidanceCell.h"             // 显示引导页 cell
/* ---------------------- View       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

static CGFloat   const  kItemLineSpacing      = 0;  //  cell Item 上下的间距
static CGFloat   const  kItemInteritemSpacing = 0;  //  cell Item 左右的间距
static CGFloat   const  kItemLRPadding        = 0;  //  cell Item 左右的边距
static CGFloat   const  kItemTBPadding        = 0;  //  cell Item 上下的边距

@interface SwpGuidanceCollectionView ()  <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate>

#pragma mark - UI   Propertys
/* ---------------------- UI   Property ---------------------- */
/* 布局 */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout_;
/* ---------------------- UI   Property ---------------------- */
#pragma mark - Data Propertys
/* ---------------------- Data Property ---------------------- */
/* 数据源 */
@property (nonatomic, copy) NSArray     *datas_;
// 记录 Cell indexPath
@property (nonatomic, copy) NSIndexPath *indexPath_;
/* SwpGuidanceCollectionView 回到方法 ，UIScrollView 开始拖动时候调用 */
@property (nonatomic, copy, setter = swpGuidanceScrollViewDidScroll:) void(^swpGuidanceScrollViewDidScroll)(SwpGuidanceCollectionView *, UIScrollView *, NSInteger);
/* SwpGuidanceCollectionView 回到方法 ，UIScrollView 当手指离开屏幕那一霎那 */
@property (nonatomic, copy, setter = swpGuidanceScrollViewDidEndDragging:) void(^swpGuidanceScrollViewDidEndDragging)(SwpGuidanceCollectionView *, UIScrollView *, BOOL, BOOL);
/* ---------------------- Data Property ---------------------- */

@end

@implementation SwpGuidanceCollectionView

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:collectionViewLayout:  ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @param  layout  layout
 *
 *  @return UICollectionView
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:self.flowLayout_]) {
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:SwpGuidanceCell.class forCellWithReuseIdentifier:NSStringFromClass(SwpGuidanceCell.class)];
        self.backgroundColor                = [UIColor whiteColor];
        self.dataSource                     = self;
        self.delegate                       = self;
        self.pagingEnabled                  = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator   = NO;
        self.bounces                        = NO;
    }
    return self;
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
    return  self.datas_.count;
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
    self.indexPath_ = indexPath;
    return SwpGuidanceCell.swpGuidanceCellInit(collectionView, NSStringFromClass(SwpGuidanceCell.class), indexPath).swpGuidance(self.datas_[indexPath.row]);
}


#pragma mark - UICollectionView Delegate Methods
/**
 *  @author swp_song
 *
 *  @brief  collectionView:layout:insetForSectionAtIndex:   ( UICollectionView 代理方法，设置 collectionView 每个 Cell 上左下右 边距 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  section                 section
 *
 *  @return UIEdgeInsets            UIEdgeInsets
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kItemTBPadding, kItemLRPadding, kItemTBPadding, kItemLRPadding);
}

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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.frame.size;
}


#pragma mark - ScrollView Delegate Methods

/**
 *  @author swp_song
 *
 *  @brief  scrollViewDidScroll:    ( UIScrollView 代理方法，开始拖动时候调用 )
 *
 *  @param  scrollView  scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger page = 0;
    
    if (self.flowLayout_.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        page = (scrollView.contentOffset.x + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
    } else {
        page = (scrollView.contentOffset.y + scrollView.frame.size.height * 0.5) / scrollView.frame.size.height;
    }
    
    if (self.swpGuidanceScrollViewDidScroll) self.swpGuidanceScrollViewDidScroll(self, scrollView, page);
}


/**
 *  @author swp_song
 *
 *  @brief  scrollViewDidScroll:    ( UIScrollView 代理方法，当手指离开屏幕那一霎那  )
 *
 *  @param  scrollView  scrollView
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSIndexPath *indexPath = [self indexPathsForVisibleItems].firstObject;
    BOOL isLastCell = indexPath.row == self.datas_.count - 1 ? YES : NO;
    if (self.swpGuidanceScrollViewDidEndDragging) self.swpGuidanceScrollViewDidEndDragging(self, scrollView, decelerate, isLastCell);
}




#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  datas   ( 设置数据 )
 */
- (SwpGuidanceCollectionView * _Nonnull (^)(NSArray * _Nonnull))datas {
    
    return ^(NSArray *datas) {
        self.datas_ = datas;
        [self reloadData];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidScroll: ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 开始拖动时候调用 )
 *
 *  @param  swpGuidanceScrollViewDidScroll  swpGuidanceScrollViewDidScroll
 */
- (void)swpGuidanceScrollViewDidScroll:(void (^)(SwpGuidanceCollectionView * _Nonnull, UIScrollView * _Nonnull, NSInteger))swpGuidanceScrollViewDidScroll {
    _swpGuidanceScrollViewDidScroll = swpGuidanceScrollViewDidScroll;
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidScrollChain ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 开始拖动时候调用 )
 */
- (SwpGuidanceCollectionView * _Nonnull (^)(void (^ _Nonnull)(SwpGuidanceCollectionView * _Nonnull, UIScrollView * _Nonnull, NSInteger)))swpGuidanceScrollViewDidScrollChain {
    
    return ^(void(^swpGuidanceScrollViewDidScroll)(SwpGuidanceCollectionView *, UIScrollView *, NSInteger)) {
        [self swpGuidanceScrollViewDidScroll:swpGuidanceScrollViewDidScroll];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidEndDragging:    ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 当手指离开屏幕那一霎那 )
 *
 *  @param  swpGuidanceScrollViewDidEndDragging
 */
- (void)swpGuidanceScrollViewDidEndDragging:(void (^)(SwpGuidanceCollectionView * _Nonnull, UIScrollView * _Nonnull, BOOL, BOOL))swpGuidanceScrollViewDidEndDragging {
    _swpGuidanceScrollViewDidEndDragging = swpGuidanceScrollViewDidEndDragging;
}


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidEndDraggingChain:   ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 当手指离开屏幕那一霎那 )
 */
- (SwpGuidanceCollectionView * _Nonnull (^)(void (^ _Nonnull)(SwpGuidanceCollectionView * _Nonnull, UIScrollView * _Nonnull, BOOL, BOOL)))swpGuidanceScrollViewDidEndDraggingChain {
    
    return ^(void(^swpGuidanceScrollViewDidEndDragging)(SwpGuidanceCollectionView *, UIScrollView *, BOOL, BOOL)) {
        [self swpGuidanceScrollViewDidEndDragging:swpGuidanceScrollViewDidEndDragging];
        return self;
    };
}

#pragma mark - Init UI Methods
- (UICollectionViewFlowLayout *)flowLayout_ {
    
    return !_flowLayout_ ? _flowLayout_ = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection              = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing           = kItemLineSpacing;
        flowLayout.minimumInteritemSpacing      = kItemInteritemSpacing;
        flowLayout;
    }) : _flowLayout_;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
