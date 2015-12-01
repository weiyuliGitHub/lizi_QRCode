//
//  DimCodeScanViewController.h
//  EDP
//
//  Created by xcy on 14-8-16.
//  Copyright (c) 2014年 新创元. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol DimCodeScanDelegate<NSObject>
-(void)DimCodeScanCalendar:(NSString *)dimCodeString;

@end
@interface DimCodeScanViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
    id<DimCodeScanDelegate> delegate;
}
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (nonatomic, retain) UIImageView * line;
@property(nonatomic,retain) id<DimCodeScanDelegate> delegate;

@end
