//
//  Calculator.m
//  MasonryTest
//
//  Created by 周海 on 16/7/29.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator


//加法
+ (NSString *)calculatorAdd:(NSString *)number1 addNumber2:(NSString *)number2{
    double value = number1.doubleValue +number2.doubleValue;
    return [NSString stringWithFormat:@"%.1f",value];
}
//减法
+ (NSString *)calculatorSubtract:(NSString *)number1 subtractNumber2:(NSString *)number2{
    double value = number1.doubleValue - number2.doubleValue;
    return [NSString stringWithFormat:@"%.1f",value];
}
////乘法
+ (NSString *)calculatorMultiply:(NSString *)number1 multiplyNumber2:(NSString *)number2{
    double value = number1.doubleValue  * number2.doubleValue;
    return [NSString stringWithFormat:@"%.1f",value];
}
////除法
+ (NSString *)calculatorEliminates:(NSString *)number1 eliminatesNumber2:(NSString *)number2{
    double value = number1.doubleValue / number2.doubleValue;
    return [NSString stringWithFormat:@"%.1f",value];
}
@end
