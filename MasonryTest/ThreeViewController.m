//
//  ThreeViewController.m
//  MasonryTest
//
//  Created by 周海 on 16/8/2.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "ThreeViewController.h"
#import "Masonry.h"
#import "CalculatorUIView.h"
#import "TestView.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TestView *testView = [[TestView alloc] init];
    testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:testView];
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.right.left.mas_equalTo(0);
        make.height.mas_equalTo(self.view.frame.size.height-64);
    }];

}



@end
