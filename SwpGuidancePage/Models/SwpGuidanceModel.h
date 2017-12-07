//
//  SwpGuidanceModel.h
//  swp_song
//
//  Created by swp_song on 16/5/27.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpGuidanceModel : NSObject

/* 图片 名称     */
@property (nonatomic, copy  ) NSString  *swpGuidanceImageName;
/* cell 索引     */
@property (nonatomic, assign) NSInteger swpGuidanceCellIndex;
/* 数据源长度    */
@property (nonatomic, assign) NSInteger swpGuidanceDataSourceCount;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceWithImageName:swpGuidanceCellIndex:swpGuidanceDataSourceCount:   ( 工厂方法 初始 )
 *
 *  @param  imageName           imageName
 *
 *  @param  cellIndex           cellIndex
 *
 *  @param  dataSourceCount     dataSourceCount
 *
 *  @return SwpGuidanceModel    SwpGuidanceModel
 */
+ (instancetype)swpGuidanceWithImageName:(NSString *)imageName swpGuidanceCellIndex:(NSInteger)cellIndex swpGuidanceDataSourceCount:(NSInteger)dataSourceCount;

/**
 *  @author swp_song
 *
 *  @brief  swpGuidanceWith: ( SwpGuidanceModel 转 模型方法  )
 *
 *  @param  dataSource  dataSource
 *
 *  @return NSArray<SwpGuidanceModel *>
 */
+ (NSArray<SwpGuidanceModel *> *)swpGuidanceWithArray:(NSArray<NSString *> *)dataSource;

@end
NS_ASSUME_NONNULL_END
