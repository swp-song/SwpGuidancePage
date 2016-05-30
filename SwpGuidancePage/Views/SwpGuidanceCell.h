//
//  SwpGuidanceCell.h
//  DyBuy
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpGuidanceCell, SwpGuidanceModel;


NS_ASSUME_NONNULL_BEGIN

@protocol SwpGuidanceCellDelegate <NSObject>

@optional

/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellClickButton: ( 点击 进入 App 按钮 调用 )
 *
 *  @param  swpGuidanceCell
 */
- (void)swpGuidanceCellClickButton:(SwpGuidanceCell *)swpGuidanceCell;

@end

@interface SwpGuidanceCell : UICollectionViewCell

/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellWithCollectionView:cellForItemAtIndexPath:forCellWithReuseIdentifier: ( 快速 初始化 SwpGuidanceCell )
 *
 *  @param  collectionView
 *
 *  @param  indexPath
 *
 *  @param  identifier
 *
 *  @return SwpGuidanceModel
 */
+ (instancetype)swpGuidanceCellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath forCellWithReuseIdentifier:(NSString *)identifier;

/*! Delegate !*/
@property (nonatomic, weak) id<SwpGuidanceCellDelegate>delegate;

/*! 显示 数据模型 !*/
@property (nonatomic, strong) SwpGuidanceModel *swpGuidance;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpGuidance: ( 设置 数据 )
 *
 *  @param  swpGuidance
 */
- (void)setSwpGuidance:(SwpGuidanceModel *)swpGuidance;

@end

NS_ASSUME_NONNULL_END
