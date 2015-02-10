//
//  ViewController.m
//  m-hubot
//
//  Created by frozenfung on 2015/2/5.
//  Copyright (c) 2015年 frozenfung. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button_1 addTarget:self action:@selector(shoot) forControlEvents:UIControlEventTouchUpInside];
    [self.button_2 addTarget:self action:@selector(choose) forControlEvents:UIControlEventTouchUpInside];

}


- (void)choose{
    NSLog(@"haha, %@", self.content.text);
}

- (void)shoot {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://mighty-hollows-6770.herokuapp.com"]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *parameters = @{@"content": self.content.text};
    [manager POST:@"m-hubot/hackathon"
       parameters: parameters
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
    return;
    
    // 從字串建立 URL
    NSURL *url = [NSURL URLWithString:@"https://mighty-hollows-6770.herokuapp.com"];
    
    // 用 URL 建立 request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 用 mutable url request 才能更改 HTTPMethod 和 HTTPHeader 等設定
    request.HTTPMethod = @"POST";
    
    // 建立一個使用 default configuration 的 session
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                          delegate:nil
                                                     delegateQueue:nil];
    
    // 根據 request 產生一個 data task，並設定拿到 data 後的動作
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data
                                                                                             options:NSJSONReadingMutableContainers
                                                                                               error:nil]);
                                            }];
    
    // 開始執行這個 data task
    [task resume];
}
@end
