//
//  SwpGuidanceModel.m
//  swp_song
//
//  Created by swp_song on 16/5/27.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpGuidanceModel.h"

@implementation SwpGuidanceModel


/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceWithImageName:swpGuidanceCellIndex:swpGuidanceDataSourceCount:   ( 工厂方法 初始 )
 *
 *  @param  imageName
 *
 *  @param  cellIndex
 *
 *  @param  dataSourceCount
 *
 *  @return SwpGuidanceModel
 */
+ (instancetype)swpGuidanceWithImageName:(NSString *)imageName swpGuidanceCellIndex:(NSInteger)cellIndex swpGuidanceDataSourceCount:(NSInteger)dataSourceCount {
    SwpGuidanceModel *swpGuidance          = [[self alloc] init];
    swpGuidance.swpGuidanceImageName       = imageName;
    swpGuidance.swpGuidanceCellIndex       = cellIndex;
    swpGuidance.swpGuidanceDataSourceCount = dataSourceCount;
    return swpGuidance;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpGuidanceWith: ( SwpGuidanceModel 转 模型方法  )
 *
 *  @param  dataSource
 *
 *  @return NSArray<SwpGuidanceModel *>
 */
+ (NSArray<SwpGuidanceModel *> *)swpGuidanceWithArray:(NSArray<NSString *> *)dataSource {
    
    NSMutableArray *arrayModel = [NSMutableArray new];
    
    [dataSource enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SwpGuidanceModel *swpGuidance = [self swpGuidanceWithImageName:obj swpGuidanceCellIndex:idx swpGuidanceDataSourceCount:dataSource.count];
        [arrayModel addObject:swpGuidance];
    }];
    
    return [NSArray arrayWithArray:arrayModel];
}

@end
