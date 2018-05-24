//
//  NSObject+ZZSwizzle.m
//  SwizzleDemo
//
//  Created by 郑来贤 on 2018/5/24.
//  Copyright © 2018年 郑来贤. All rights reserved.
//

#import "NSObject+ZZSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (ZZSwizzle)
+ (BOOL)zz_swizzleMethod:(SEL)origSel altMethod:(SEL)altSel{
    
    NSParameterAssert(origSel);
    NSParameterAssert(altSel);
    if (!origSel || !altSel) return NO;
    
    Method originalMethod = class_getInstanceMethod(self, origSel);
    Method swizzleMethod = class_getInstanceMethod(self, altSel);
    BOOL didAddMethod = class_addMethod(self, origSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(self, altSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    return YES;
}

@end
