//
//  ViewController.m
//  BenChartViewDemo
//
//  Created by Ben on 10/15/2015.
//  Copyright © 2015 com.ben. All rights reserved.
//

#import "ViewController.h"
#import "BenBarChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BenBarChartView *chartView = [[BenBarChartView alloc]initWithFrame:CGRectMake(10.0, 50.0, self.view.frame.size.width - 10.0 * 2, 320.0) xAxisValues:@[@"1", @"2", @"3", @"4" , @"5", @"6", @"7"] yAxisValues:@[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7"] values:@[@(1), @(2), @(3), @(4), @(5), @(6), @(7)]];
    [self.view addSubview:chartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
