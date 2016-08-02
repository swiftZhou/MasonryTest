//
//  TestView.m
//  MasonryTest
//
//  Created by 周海 on 16/8/1.
//  Copyright © 2016年 zhouhai. All rights reserved.
//
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#import "TestView.h"
#import "Masonry.h"
#import "PlantInfoView.h"
@interface TestView()
@property (nonatomic, strong) UIImageView *topInleftImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@end
@implementation TestView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark -
- (void)createUI{
    
    // 创建顶部左边UIimageView
    self.topInleftImageView = [UIImageView new];
    _topInleftImageView.layer.cornerRadius = 5.0;
    _topInleftImageView.image = [UIImage imageNamed:@"nvsheng"];
    _topInleftImageView.layer.masksToBounds = YES;
    [self addSubview:_topInleftImageView];
    
    // 名称 uilabel
    self.nameLabel = [UILabel new];
    _nameLabel.backgroundColor = [UIColor grayColor];
    _nameLabel.font = [UIFont systemFontOfSize:20.f];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.text = @"林志玲";
    [self addSubview:_nameLabel];
    
    //植物养护
    UILabel *plantLabel = [UILabel new];
    plantLabel.text = @"植物养护";
    plantLabel.font = [UIFont systemFontOfSize:14.f];
    [self addSubview:plantLabel];
    
    
    UIView *plantview = [UIView new];
    plantview.layer.cornerRadius = 5.0;
    plantview.layer.masksToBounds = YES;
    plantview.layer.borderWidth = 1.0;
    plantview.layer.borderColor = [UIColor grayColor].CGColor;
    [self addSubview:plantview];
    
    [self plantLabelInfodataView:plantview];
    
    //植物简介
    UILabel *plantInfoLabel = [UILabel new];
    plantInfoLabel.text = @"植物简介";
    plantInfoLabel.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:plantInfoLabel];
    
    UIView *plantInfoView = [UIView new];
    plantInfoView.layer.cornerRadius = 5.0;
    plantInfoView.layer.masksToBounds = YES;
    plantInfoView.layer.borderWidth = 1.0;
    plantInfoView.layer.borderColor = [UIColor grayColor].CGColor;
    [self addSubview:plantInfoView];
    [self plantInfodataView:plantInfoView];
    
    //给_topInleftImageView 添加约束
    [_topInleftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(KScreenWidth/3.0, KScreenWidth/3.0));
    }];
    
    //给名称添加约束
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo((KScreenWidth/3.0)/2.0 - 20);
        make.left.equalTo(_topInleftImageView.mas_right).offset(10);
        make.right.equalTo(self);
        make.height.mas_equalTo(40);
    }];
    
    
    //给植物养护文字添加约束
    [plantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topInleftImageView.mas_bottom).offset(15);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(100, 21));
        
    }];

    [plantview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(plantLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(150);
    }];
    
    //给植物简介添加约束
    [plantInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(plantview.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(100, 21));
    }];
    
    [plantInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(plantInfoLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(150);
    }];
   
}

#pragma mark - 植物养护内容
- (void)plantLabelInfodataView:(UIView *)superView{
    NSArray *typsName = @[@"水分",@"光照",@"温度",@"肥料"];
    for (int i = 0; i <4; i++) {
        PlantInfoView *view = [[PlantInfoView alloc] init];
        [view setStrInName:typsName[i]];
        [superView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(i*35);
            make.right.and.left.equalTo(superView);
            make.height.mas_equalTo(150/4.0);
        }];
        
    }
}

#pragma makr - 植物简介内容
- (void)plantInfodataView:(UIView *)superView{
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textColor = [UIColor grayColor];
    label.text = @"Masonry是一个轻量级的布局框架，拥有自己的描述语法，采用更优雅的链式语法封装自动布局，简洁明了并具有高可读性，而且同时支持 iOS 和 Max OS X。Masonry是一个用代码写iOS或OS界面的库，可以代替Auto layout。\n mas_makeConstraints 是给view添加约束，约束有几种，分别是边距，宽，高，左上右下距离，基准线。添加过约束后可以有修正，修正有offset（位移）修正和multipliedBy（倍率）修正。";
    label.numberOfLines = 0;
    [superView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.and.right.equalTo(superView);
        make.height.mas_equalTo(150);
    }];
}
@end
