//
//  SwpGuidanceCell.m
//  swp_song
//
//  Created by swp_song on 16/5/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpGuidanceCell.h"

/* ---------------------- Model      ---------------------- */
#import "SwpGuidanceModel.h"            // 数据模型
/* ---------------------- Model      ---------------------- */


@interface SwpGuidanceCell ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* 显示引导页 imageView */
@property (nonatomic, strong) UIImageView *swpGuidanceImageView;
/* ---------------------- UI   Property  ---------------------- */


@end

@implementation SwpGuidanceCell

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:  ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @return UICollectionViewCell
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  layoutSubviews  ( Override layoutSubviews )
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    self.swpGuidanceImageView.frame = self.bounds;
}

/**
 *  @author swp_song
 *
 *  @brief  setUI ( 设置 UI 控件 )
 */
- (void)setUI {
    [self.contentView addSubview:self.swpGuidanceImageView];
}

/**
 *  @author swp_song
 *
 *  @brief  setData:    ( 设置 数据 )
 *
 *  @param  swpGuidance swpGuidance
 */
- (void)setData:(SwpGuidanceModel *)swpGuidance {
    self.swpGuidanceImageView.image = [UIImage imageNamed:swpGuidance.swpGuidanceImageName];
}




#pragma mark - Public Methods

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
+ (instancetype)swpGuidanceCellWithCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceCellInit ( 快速初始化一个 Cell )
 */
+ (__kindof SwpGuidanceCell * _Nonnull (^)(UICollectionView * _Nonnull, NSString * _Nonnull, NSIndexPath * _Nonnull))swpGuidanceCellInit {
    return ^(UICollectionView *collectionView, NSString *identifier, NSIndexPath * indexPath) {
        return [self.class swpGuidanceCellWithCollectionView:collectionView reuseIdentifier:identifier forIndexPath:indexPath];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpGuidance: ( 设置数据 )
 */
- (SwpGuidanceCell * _Nonnull (^)(SwpGuidanceModel * _Nonnull))swpGuidance {
    
    return ^(SwpGuidanceModel *swpGuidance) {
        [self setData:swpGuidance];
        return self;
    };
}


#pragma mark - Init Data Methods
- (UIImageView *)swpGuidanceImageView {
    return !_swpGuidanceImageView ? _swpGuidanceImageView = ({
        [UIImageView new];
    }) : _swpGuidanceImageView;
}

@end
