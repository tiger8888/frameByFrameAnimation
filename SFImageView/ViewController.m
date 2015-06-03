//
//  ViewController.m
//  SFImageView
//
//  Created by sbx_fc on 15/6/3.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import "ViewController.h"
#import "SFImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SFImageView* image = [[SFImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
