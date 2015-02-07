//
//  ViewController.m
//  m-hubot
//
//  Created by frozenfung on 2015/2/5.
//  Copyright (c) 2015年 frozenfung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button_1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button_1 addTarget:self action:@selector(sayHello) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sayHello {
    // TODO: POST http request
}

@end
