//
//  ViewController.m
//  Demo-DCObserver
//
//  Created by DanaChu on 16/9/5.
//  Copyright © 2016年 DanaChu. All rights reserved.
//

#import "ViewController.h"
#import "DCObserver.h"



@interface ViewController ()

@property (nonatomic, strong) NSArray  *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 同一个对象可以多次监听同一个路径，完成不同的功能，提高代码的可读性，便于维护。
    [self dc_addObserverBlockForKeyPath:KEYPATH(self, dataSource) block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {
       
        NSLog(@"+++++++++++");
        NSLog(@"old Value = %@", oldVal);
        NSLog(@"new Value = %@", newVal);
        
    }];
    
    self.dataSource = @[];
    self.dataSource = @[@"张三"];
    
    
    [self dc_addObserverBlockForKeyPath:KEYPATH(self, dataSource) block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {
       
        NSLog(@"----------");
        
    }];
    
    self.dataSource = @[@"张三, 李四"];
    self.dataSource = @[@"王五"];
    
    
    // 同一个对象可以多次监听同一个通知，完成不同的功能，分门别类，提高代码的可读性，便于维护。
    
    [self dc_addObserverBlockForNotificationName:@"NotificationName" block:^(id  _Nullable __weak obj, NSNotification * _Nonnull noti) {
        NSLog(@"NotificationA");
    }];
    
    [self dc_addObserverBlockForNotificationName:@"NotificationName" block:^(id  _Nullable __weak obj, NSNotification * _Nonnull noti) {
        NSLog(@"NotificationB");
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationName" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
