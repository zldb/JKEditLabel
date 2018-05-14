//
//  ViewController.m
//  JKEditLabel
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import "JKEditLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JKEditLabel * label = [[JKEditLabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    label.text = @"这是个可编辑的label1";
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    JKEditLabel * label1 = [[JKEditLabel alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    label1.text = @"这是个可编辑的label2";
    label1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label1];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
