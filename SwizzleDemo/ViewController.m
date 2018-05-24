//
//  ViewController.m
//  SwizzleDemo
//
//  Created by 郑来贤 on 2018/5/23.
//  Copyright © 2018年 郑来贤. All rights reserved.
//

#import "ViewController.h"
#import "Father.h"
#import "Son.h"
#import "Animal.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    Method originalMethod = class_getInstanceMethod([Father class], @selector(work));
//    Method swizzleMethod = class_getInstanceMethod([Animal class], @selector(animal_wrok));
//    method_exchangeImplementations(originalMethod, swizzleMethod);
    [[Father new] work];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
