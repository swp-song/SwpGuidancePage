//
//  SwpGuidanceCollectionView.h
//  swp_song
//
//  Created by swp_song on 2017/12/14.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpGuidanceCollectionView : UICollectionView

/**
 *  @author swp_song
 *
 *  @brief  datas   ( 设置数据 )
 */
- (SwpGuidanceCollectionView * _Nonnull (^)(NSArray * _Nonnull))datas;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidScroll: ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 开始拖动时候调用 )
 *
 *  @param  swpGuidanceScrollViewDidScroll  swpGuidanceScrollViewDidScroll
 */
- (void)swpGuidanceScrollViewDidScroll:(void (^)(SwpGuidanceCollectionView * _Nonnull swpGuidanceCollectionView, UIScrollView * _Nonnull scrollView, NSInteger page))swpGuidanceScrollViewDidScroll;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidScrollChain ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 开始拖动时候调用 )
 */
- (SwpGuidanceCollectionView * _Nonnull (^)(void (^ _Nonnull)(SwpGuidanceCollectionView * _Nonnull, UIScrollView * _Nonnull, NSInteger)))swpGuidanceScrollViewDidScrollChain;


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidEndDragging:    ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 当手指离开屏幕那一霎那)
 *
 *  @param  swpGuidanceScrollViewDidEndDragging swpGuidanceScrollViewDidEndDragging
 */
- (void)swpGuidanceScrollViewDidEndDragging:(void (^)(SwpGuidanceCollectionView * _Nonnull swpGuidanceCollectionView, UIScrollView * _Nonnull scrollView, BOOL decelerate, BOOL isLastCell))swpGuidanceScrollViewDidEndDragging;


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceScrollViewDidEndDraggingChain:   ( SwpGuidanceCollectionView 回到方法 ，UIScrollView 当手指离开屏幕那一霎那 )
 */
- (SwpGuidanceCollectionView * _Nonnull (^)(void (^ _Nonnull)(SwpGuidanceCollectionView * _Nonnull, UIScrollView * _Nonnull, BOOL, BOOL)))swpGuidanceScrollViewDidEndDraggingChain;

@end
NS_ASSUME_NONNULL_END
