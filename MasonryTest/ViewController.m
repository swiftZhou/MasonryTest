//
//  ViewController.m
//  MasonryTest
//
//  Created by 周海 on 16/7/29.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "Masonry.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController
static NSString *indentStr = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *mytableview = [[UITableView alloc] init];
    mytableview.delegate = self;
    mytableview.dataSource = self;
    mytableview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:mytableview];
    [mytableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma make - tableviewDelegate-
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentStr];
    }
    if (indexPath.row ==0) {
        cell.textLabel.text = @"计算器UI";
    }else{
        cell.textLabel.text = @"林志玲";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TwoViewController *towVC = [[TwoViewController alloc] init];
        [self.navigationController pushViewController:towVC animated:YES];
    } else{
        ThreeViewController *three = [[ThreeViewController alloc] init];
        [self.navigationController pushViewController:three animated:YES];
    }

}
#pragma makr - 随便测试玩
- (void)test{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        // masequalTo 和 equalTo 区别：masequalTo 比equalTo多了类型转换操作，一般来说，大多数时候两个方法都是 通用的，但是对于数值元素使用mas_equalTo。对于对象或是多个属性的处理，使用equalTo。特别是多个属性时，必须使用equalTo,例如 make.left.and.right.equalTo(self.view);
        make.center.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(view);
        make.top.equalTo(view);
        make.left.equalTo(view).offset(110);
    }];
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor redColor];
    [self.view addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.center.x-(20));
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor yellowColor];
    [view addSubview:view4];
    [view4 mas_remakeConstraints:^(MASConstraintMaker *make) {
        //上下左右边距都为10
        //注意到方法with和and,这连个方法其实没有做任何操作，方法只是返回对象本身，这这个方法的左右完全是为了方法写的时候的可读性
        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

@end
