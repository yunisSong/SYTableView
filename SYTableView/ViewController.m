//
//  ViewController.m
//  SYTableView
//
//  Created by Yunis on 17/6/12.
//  Copyright © 2017年 Yunis. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"
@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)pushDemoView:(id)sender {
    
    DemoViewController *demo = [DemoViewController new];
    
    [self.navigationController pushViewController:demo animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
