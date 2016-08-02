//
//  PlantInfoView.m
//  MasonryTest
//
//  Created by 周海 on 16/8/2.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "PlantInfoView.h"
#import "Masonry.h"
@interface PlantInfoView()
@property (nonatomic, strong) UILabel *label;
@end
@implementation PlantInfoView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    self.label = [UILabel new];
    _label.font = [UIFont systemFontOfSize:14.0];
    _label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_label];
    
    UIView *baceView = [UIView new];
    [self addSubview:baceView];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(80, 25));
    }];
    
    [baceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(self);
        make.height.mas_equalTo(25);
    }];

    for (int i = 0; i<5; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        [baceView addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(baceView);
            make.left.mas_equalTo(i*35);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
    }
}

- (void)setStrInName:(NSString *)typeStrName{
    self.label.text = typeStrName;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
