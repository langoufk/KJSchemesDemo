//
//  ViewController.m
//  AppDemo2
//
//  Created by 杨科军 on 2019/10/16.
//  Copyright © 2019 杨科军. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    NSURL* urlLocal = [NSURL URLWithString:@"AppDemo1://xxxx"];
    // 判断是否可以启动该 url
    if([[UIApplication sharedApplication] canOpenURL:urlLocal]){
        [[UIApplication sharedApplication] openURL:urlLocal options:@{} completionHandler:nil];
    }
}

@end
