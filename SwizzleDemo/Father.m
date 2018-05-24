//
//  Father.m
//  SwizzleDemo
//
//  Created by 郑来贤 on 2018/5/23.
//  Copyright © 2018年 郑来贤. All rights reserved.
//

#import "Father.h"

@implementation Father
- (void)work{
    NSLog(@"Father work");
    NSLog(@"%@", self);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self work];
        
    }
    return self;
}
@end
