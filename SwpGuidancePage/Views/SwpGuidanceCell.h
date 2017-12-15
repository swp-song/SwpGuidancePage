//
//  SwpGuidanceCell.h
//  swp_song
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpGuidanceCell, SwpGuidanceModel;


NS_ASSUME_NONNULL_BEGIN

@interface SwpGuidanceCell : UICollectionViewCell

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellWithCollectionView:reuseIdentifier:forIndexPath: ( 快速初始化一个 Cell )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  identifier      identifier
 *
 *  @param  indexPath       indexPath
 *
 *  @return UICollectionViewCell
 */
+ (instancetype)swpGuidanceCellWithCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;


/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellInit ( 快速初始化一个 Cell )
 */
+ (__kindof SwpGuidanceCell * _Nonnull (^)(UICollectionView * _Nonnull, NSString * _Nonnull, NSIndexPath * _Nonnull))swpGuidanceCellInit;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidance: ( 设置数据 )
 */
- (SwpGuidanceCell * _Nonnull (^)(SwpGuidanceModel * _Nonnull))swpGuidance;


@end

NS_ASSUME_NONNULL_END
