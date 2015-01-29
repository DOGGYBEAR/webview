//
//  vcMainWebView.m
//  WebApp_Picture
//
//  Created by BearHuang on 2015/1/28.
//  Copyright (c) 2015年 xyzprinting. All rights reserved.
//

#import "vcMainWebView.h"

@interface vcMainWebView ()

@end

@implementation vcMainWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = [NSString stringWithFormat:@"http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw"];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
