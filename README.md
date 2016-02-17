# BenChartView
It's a great library for drawing ios chart view

###Usage:
You can init a chartView into your view easily like this
```
BenBarChartView *chartView = [[BenBarChartView alloc]initWithFrame:CGRectMake(10.0, 50.0, self.view.frame.size.width - 10.0 * 2, 320.0) xAxisValues:@[@"1", @"2", @"3", @"4" , @"5", @"6", @"7"] yAxisValues:@[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7"] values:@[@(1), @(2), @(3), @(4), @(5), @(6), @(7)]];
    [self.view addSubview:chartView];
```
