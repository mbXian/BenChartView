//
//  BenBarChartView.m
//  Test
//
//  Created by Ben on 10/15/2015.
//  Copyright © 2015 com.Ben. All rights reserved.
//

#import "BenBarChartView.h"

#define ChartTitleView_Height 30.0f
#define ChartTitleView_Width self.frame.size.width
#define AxisMarginViewInterval 40.0f //轴与图的margin
#define Axis_Width 0.3f //轴宽
#define ValueLabel_Height 20.0 //值的label高度
#define ValueLabelMarginAxis 5.0f //值label到轴距离
#define BarMarginYAxis 5.0f //柱图margin Y轴

@implementation BenBarChartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame xAxisValues:(NSArray *)xAxisValues yAxisValues:(NSArray *)yAxisValues values:(NSArray *)values{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        //add chartView title label
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height - ChartTitleView_Height, ChartTitleView_Width, ChartTitleView_Height)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.text = @"";
        [self addSubview:self.titleLabel];
        
        //add XAxis
        UIView *xAxis = [[UIView alloc]initWithFrame:CGRectMake(AxisMarginViewInterval, self.frame.size.height - ChartTitleView_Height - ValueLabel_Height, self.frame.size.width - 2 * AxisMarginViewInterval, Axis_Width)];
        xAxis.backgroundColor = [UIColor whiteColor];
        [self addSubview:xAxis];
        
        //add YAxis
        UIView *yAxis = [[UIView alloc]initWithFrame:CGRectMake(AxisMarginViewInterval, AxisMarginViewInterval, Axis_Width, self.frame.size.height - ChartTitleView_Height - AxisMarginViewInterval - ValueLabel_Height - Axis_Width)];
        yAxis.backgroundColor = [UIColor whiteColor];
        [self addSubview:yAxis];
        
        //zero Point
        CGPoint zeroPoint = CGPointMake(AxisMarginViewInterval, AxisMarginViewInterval + yAxis.frame.size.height);
        
        //add YAxis values
        CGFloat yAxisInterval = (yAxis.frame.size.height - 10.0) / ((CGFloat)yAxisValues.count - 1);
        
        for (int i = 0; i < yAxisValues.count; i++) {
            UILabel *yValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(ValueLabelMarginAxis, (zeroPoint.y - i * yAxisInterval) - ValueLabel_Height / 2.0, AxisMarginViewInterval - 2 * ValueLabelMarginAxis, ValueLabel_Height)];
            yValueLabel.textAlignment = NSTextAlignmentRight;
            yValueLabel.font = [UIFont systemFontOfSize:10];
            yValueLabel.textColor = [UIColor whiteColor];
            yValueLabel.text = [yAxisValues objectAtIndex:i];
            [self addSubview:yValueLabel];
        }
        
        //XAxis zero point
        CGPoint xZeroPoint = CGPointMake(AxisMarginViewInterval + BarMarginYAxis, AxisMarginViewInterval + yAxis.frame.size.height);
        //add XAxis values
        CGFloat bar_Width = (xAxis.frame.size.width - 2 * BarMarginYAxis) / (2.0 * xAxisValues.count - 1);
        CGFloat xValueLabel_Width = 2 * bar_Width;
        for (int i = 0; i < xAxisValues.count; i++) {
            UILabel *xValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(xZeroPoint.x - bar_Width / 2.0 + i * xValueLabel_Width, xAxis.frame.origin.y + Axis_Width, xValueLabel_Width, ValueLabel_Height)];
            xValueLabel.textAlignment = NSTextAlignmentCenter;
            xValueLabel.font = [UIFont systemFontOfSize:10];
            xValueLabel.textColor = [UIColor whiteColor];
            xValueLabel.text = [xAxisValues objectAtIndex:i];
            [self addSubview:xValueLabel];
        }
        
        //add bar
        for (int i = 0; i < values.count; i++) {
            CGFloat value = (CGFloat)[[values objectAtIndex:i] floatValue];
            UIView *bar = [[UIView alloc]initWithFrame:CGRectMake(xZeroPoint.x + i * 2 * bar_Width, xZeroPoint.y - value * yAxisInterval, bar_Width, value * yAxisInterval)];
            bar.backgroundColor = [UIColor whiteColor];
            [self addSubview:bar];
        }
    }
    return self;
}
@end
