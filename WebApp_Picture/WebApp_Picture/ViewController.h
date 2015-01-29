//
//  ViewController.h
//  WebApp_Picture
//
//  Created by BearHuang on 2015/1/23.
//  Copyright (c) 2015年 xyzprinting. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UIWebViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

-(IBAction)takePhoto:(id)sender;
-(IBAction)takeLibrary:(id)sender;
-(IBAction)go2Webview:(id)sender;

@end

