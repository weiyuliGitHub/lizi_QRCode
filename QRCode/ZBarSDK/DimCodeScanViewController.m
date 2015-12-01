//
//  DimCodeScanViewController.m
//  EDP
//
//  Created by xcy on 14-8-16.
//  Copyright (c) 2014年 新创元. All rights reserved.
//

#import "DimCodeScanViewController.h"
#import "AppDelegate.h"
#import "ZBarSDK.h"
@interface DimCodeScanViewController ()

@end
#define  ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define  ScreenHeight  [[UIScreen mainScreen] bounds].size.height
@implementation DimCodeScanViewController
@synthesize delegate;
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
    
    self.view.backgroundColor = [UIColor grayColor];
	UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [scanButton setTitle:@"取消" forState:UIControlStateNormal];
    [scanButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    scanButton.backgroundColor=[UIColor whiteColor];
    [scanButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    
    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(15, 40, ScreenWidth-30, 50)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.numberOfLines=2;
    labIntroudction.textColor=[UIColor whiteColor];
    labIntroudction.text=@"将二维码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别。";
    [self.view addSubview:labIntroudction];

    
    UIImageView * imageView = [[UIImageView alloc]init];
//    if (iPadAir) {
//         imageView.frame=CGRectMake(10, 100, ScreenWidth-20, 300+400);
//    }else
//    {
    imageView.frame=CGRectMake(10, 100, ScreenWidth-20, 300);
//    }
    imageView.image = [UIImage imageNamed:@"pick_bg"];
    [self.view addSubview:imageView];
 
    scanButton.frame = CGRectMake((ScreenWidth-120)/2, imageView.frame.origin.y+imageView.frame.size.height+40, 120, 40);

    upOrdown = NO;
    num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(50, 110, ScreenWidth-100, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
     [super viewDidLoad];
    
    
}
-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(50, 110+2*num, ScreenWidth-100, 2);
        if (2*num == ScreenWidth-100) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(50, 110+2*num, ScreenWidth-100, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}
-(void)backAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        [timer invalidate];
    }];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
   [self setupCamera];
}
- (void)setupCamera
{
    /*扫描二维码部分：
      导入ZBarSDK文件并引入一下框架
      AVFoundation.framework
      CoreMedia.framework
      CoreVideo.framework
      QuartzCore.framework
      libiconv.dylib

      */
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
//    if (iPadAir) {
//           _preview.frame =CGRectMake(20,110,ScreenWidth-40,280+400);
//    }else
//    {
    _preview.frame =CGRectMake(20,110,ScreenWidth-40,280);
//    }
    [self.view.layer insertSublayer:self.preview atIndex:0];
    
    
    
    // Start
    [_session startRunning];
}
#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [_session stopRunning];
    
    if (stringValue.length>0) {
        
        [self dismissViewControllerAnimated:YES completion:^
         {
             [timer invalidate];
             NSLog(@"%@",stringValue);
             if ([delegate respondsToSelector:@selector(DimCodeScanCalendar:)]) {
                 [delegate DimCodeScanCalendar:stringValue];
             }

         }];
        
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"未得到二维码扫描信息" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"继续扫描", nil];
        [alert show];
        [alert release];
    
    }
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch ( buttonIndex ) {
            
        case 0:{
            [self dismissViewControllerAnimated:YES completion:^
             {
                 [timer invalidate];
                 
             }];
        } break;
            
        case 1:{
            [self setupCamera];
        } break;
            
        default:
            break;
    }
    


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
