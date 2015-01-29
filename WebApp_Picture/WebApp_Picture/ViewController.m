//
//  ViewController.m
//  WebApp_Picture
//
//  Created by BearHuang on 2015/1/23.
//  Copyright (c) 2015年 xyzprinting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
//    NSString *language = [[NSLocale preferredLanguages]objectAtIndex:0];
//    NSLog(@"language Local = %@",language);
    
    
    
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw"];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
//    if ([language  isEqual:@"en"]) {
//        [self showWebView:@"http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw"];
//    }else if ([language  isEqual:@"ja"]) {
//        [self showWebView:@"http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw"];
//    }else if ([language  isEqual:@"zh-Hant"]) {
//        [self showWebView:@"http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw"];
//    }else if ([language  isEqual:@"zh-Hans"]) {
//        [self showWebView:@"http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw"];
//    }else{
//        [self showWebView:@"http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw"];
//    }
//    http://apps.xyzprinting.com/photoboard/playing?lang=tw_zh_tw
    
    //upload model to member's MyUpload.
    //service.xyzprinting.com/XZYGallery/Gallery/JSON?key="+token"+"JSON string"
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}

//- (IBAction)takePhoto:(UIButton *)sender {
//    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    
//    [self presentViewController:picker animated:YES completion:NULL];
//    
//}
//
//- (IBAction)selectPhoto:(UIButton *)sender {
//    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    
//    [self presentViewController:picker animated:YES completion:NULL];
//    
//    
//}


-(IBAction)takeLibrary:(id)sender{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(IBAction)takePhoto:(id)sender{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

-(IBAction)go2Webview:(id)sender{
//    [self performSegueWithIdentifier:@"push2Detail" sender:cell.lblModelID];
    [self performSegueWithIdentifier:@"push2WebView" sender:nil];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    //UIImageWriteToSavedPhotosAlbum(chosenImage, self, @selector(image::contextInfo:), nil);
    UIImageWriteToSavedPhotosAlbum(chosenImage, self, @selector(image:didfinishedSavingWithError:contextInfo:), nil);
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    self.imageView.image = chosenImage;
    
    
    
    //obtaining saving path
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"latest_photo.png"];
    
    //extracting image from the picker and saving it
//    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
//    if ([mediaType isEqualToString:@"public.image"]){
//        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
//        NSData *webData = UIImagePNGRepresentation(editedImage);
//        [webData writeToFile:imagePath atomically:YES];

    
}
    

-(void)image:(UIImage *)image didfinishedSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"\
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
