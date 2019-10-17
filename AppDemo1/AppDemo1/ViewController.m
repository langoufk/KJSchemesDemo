//
//  ViewController.m
//  AppDemo1
//
//  Created by 杨科军 on 2019/10/16.
//  Copyright © 2019 杨科军. All rights reserved.
//


#import "ViewController.h"
#import "KJSchemesTool.h"

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
    [KJSchemesTool kj_schemesWithLSApplicationQueriesSchemes:@"AppDemo2" AppID:@"12345" Parameter:@{@"xxx":@"123",@"A":@"a"}];
}


@end
