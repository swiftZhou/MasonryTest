//
//  Calculator.h
//  MasonryTest
//
//  Created by 周海 on 16/7/29.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
//加法
+ (NSString *)calculatorAdd:(NSString *)number1 addNumber2:(NSString *)number2;
//减法
+ (NSString *)calculatorSubtract:(NSString *)number1 subtractNumber2:(NSString *)number2;
////乘法
+ (NSString *)calculatorMultiply:(NSString *)number1 multiplyNumber2:(NSString *)number2;
////除法
+ (NSString *)calculatorEliminates:(NSString *)number1 eliminatesNumber2:(NSString *)number2;
@end
