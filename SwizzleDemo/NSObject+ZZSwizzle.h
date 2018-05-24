//
//  NSObject+ZZSwizzle.h
//  SwizzleDemo
//
//  Created by 郑来贤 on 2018/5/24.
//  Copyright © 2018年 郑来贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZZSwizzle)

/*
 * 方法交换
 */
+ (BOOL)zz_swizzleMethod:(SEL)origSel altMethod:(SEL)altSel;

@end
