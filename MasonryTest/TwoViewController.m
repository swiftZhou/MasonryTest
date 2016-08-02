//
//  TwoViewController.m
//  MasonryTest
//
//  Created by 周海 on 16/8/2.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "TwoViewController.h"
#import "Masonry.h"
#import "CalculatorUIView.h"
#import "TestView.h"
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //计算器UI
    CalculatorUIView *calcutatorView = [[CalculatorUIView alloc] init];
    [self.view addSubview:calcutatorView];
    [calcutatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}



@end
