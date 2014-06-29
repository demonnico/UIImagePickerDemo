//
//  ViewController.m
//  UIImagePickerDemo
//
//  Created by Nicholas Tau on 6/27/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

#import "ViewController.h"
@import AssetsLibrary;

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    picker.showsCameraControls = YES;

    [self addChildViewController:picker];
    [self.view addSubview:picker.view];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (info) {
        UIImage * originalImage = info[UIImagePickerControllerOriginalImage];
        [[ALAssetsLibrary new] writeImageDataToSavedPhotosAlbum:[NSData data]
                                                   metadata:nil
                                            completionBlock:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
