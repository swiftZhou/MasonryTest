//
//  CalculatorUIView.m
//  MasonryTest
//
//  Created by 周海 on 16/7/29.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define BtnNumbers @[@"AC",@"+/-",@"%",@"÷",@"7",@"8",@"9",@"X",@"4",@"5",@"6",@"-",@"1",@"2",@"3",@"+"]

#import "CalculatorUIView.h"
#import "Calculator.h"
#import "Masonry.h"
@interface CalculatorUIView()
@property (nonatomic,strong) UILabel *displayLabel;
@property (nonatomic,strong) UIView *numberBackgroundView;
@property (nonatomic,copy) NSString *tempNumberStr;
@end
@implementation CalculatorUIView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self createDisplayView];
        [self createNumberButtons];
    }
    return self;
}

#pragma mark -创建显示屏
- (void)createDisplayView{
    self.displayLabel = [UILabel new];
    _displayLabel.backgroundColor = [UIColor blackColor];
    _displayLabel.textAlignment = NSTextAlignmentRight;
    _displayLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:40.f];
    _displayLabel.numberOfLines = 0;
    _displayLabel.text = @"";
    _displayLabel.textColor = [UIColor whiteColor];
    [self addSubview:_displayLabel];
    [_displayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.left.mas_equalTo(0);
        make.height.mas_equalTo(150);
    }];
}
#pragma makr - 创建数字按钮
- (void)createNumberButtons{
    int numIndex = 0;
    float btnWidth = KScreenWidth / 4.0;
    float btnHeight = (KScreenHeight-150) / 5.0;
    self.numberBackgroundView = [UIView new];
    _numberBackgroundView.backgroundColor = [UIColor redColor];
    [self addSubview:_numberBackgroundView];
    [_numberBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(150);
        make.right.and.left.and.bottom.mas_equalTo(0);
    }];

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            self.layer.shouldRasterize = YES;
            self.layer.rasterizationScale = [UIScreen mainScreen].scale;
            CGPathRef path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
            [self.layer setShadowPath:path];
            UIButton *btn = [UIButton new];
            btn.backgroundColor = [UIColor whiteColor];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
            btn.layer.borderWidth = 1.0;
            btn.layer.borderColor = [UIColor blackColor].CGColor;
            [btn setTitle:BtnNumbers[numIndex] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [_numberBackgroundView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(i*btnHeight);
                make.left.mas_equalTo(j*btnWidth);
                make.size.mas_equalTo(CGSizeMake(btnWidth, btnHeight));
            }];
            numIndex++;
        }
    }
    
    //创建底部"0",".","=" 这3个按钮
    UIButton *zeroBut = [UIButton new];
    zeroBut.backgroundColor = [UIColor whiteColor];
    zeroBut.titleLabel.textAlignment = NSTextAlignmentCenter;
    zeroBut.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
    zeroBut.layer.borderWidth = 1.0;
    zeroBut.layer.borderColor = [UIColor blackColor].CGColor;
    [zeroBut setTitle:@"0" forState:UIControlStateNormal];
    [zeroBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [zeroBut addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_numberBackgroundView addSubview:zeroBut];
    
    // "."
    UIButton *pointBut = [UIButton new];
    pointBut.backgroundColor = [UIColor whiteColor];
    pointBut.titleLabel.textAlignment = NSTextAlignmentCenter;
    pointBut.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
    pointBut.layer.borderWidth = 1.0;
    pointBut.layer.borderColor = [UIColor blackColor].CGColor;
    [pointBut setTitle:@"." forState:UIControlStateNormal];
    [pointBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pointBut addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_numberBackgroundView addSubview:pointBut];
    
    // "="
    UIButton *equalBut = [UIButton new];
    equalBut.backgroundColor = [UIColor whiteColor];
    equalBut.titleLabel.textAlignment = NSTextAlignmentCenter;
    equalBut.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
    equalBut.layer.borderWidth = 1.0;
    equalBut.layer.borderColor = [UIColor blackColor].CGColor;
    [equalBut setTitle:@"=" forState:UIControlStateNormal];
    [equalBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [equalBut addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_numberBackgroundView addSubview:equalBut];
    

    [zeroBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_numberBackgroundView);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(btnWidth*2, btnHeight));
    }];
    
    [pointBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_numberBackgroundView);
        make.left.equalTo(zeroBut).offset(btnWidth*2);
        make.size.mas_equalTo(CGSizeMake(btnWidth, btnHeight));
    }];
    
    [equalBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_numberBackgroundView);
        make.right.equalTo(_numberBackgroundView);
        make.size.mas_equalTo(CGSizeMake(btnWidth, btnHeight));
    }];

}

#pragma makr 点击事件
- (void)btnAction:(UIButton *)btn{


}
@end
