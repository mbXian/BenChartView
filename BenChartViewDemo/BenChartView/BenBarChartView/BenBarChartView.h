//
//  BenBarChartView.h
//  Test
//
//  Created by Ben on 10/15/2015.
//  Copyright © 2015 com.Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BenBarChartView : UIView

/**
 * @brief ChartView Title
 **/
@property (strong, nonatomic) UILabel *titleLabel;

- (instancetype)initWithFrame:(CGRect)frame xAxisValues:(NSArray *)xAxisValues yAxisValues:(NSArray *)yAxisValues values:(NSArray *)values;
@end
