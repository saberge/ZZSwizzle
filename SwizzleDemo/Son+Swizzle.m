//
//  Son+Swizzle.m
//  SwizzleDemo
//
//  Created by 郑来贤 on 2018/5/23.
//  Copyright © 2018年 郑来贤. All rights reserved.
//

#import "Son+Swizzle.h"
#import <objc/runtime.h>
#import "Animal.h"

@implementation Son (Swizzle)

+ (void)load{
    simple_Swizzle([Father class], @selector(work), @selector(son_work));
}

- (void)son_work{
   NSLog(@"son_category work") ;
   [self son_work];
}

BOOL simple_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel){
    
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    method_exchangeImplementations(originalMethod, swizzleMethod);
    
    return YES;
}
BOOL best_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel){
    
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    BOOL didAddMethod = class_addMethod(aClass, originalSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass, swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    
    return YES;
}
@end
