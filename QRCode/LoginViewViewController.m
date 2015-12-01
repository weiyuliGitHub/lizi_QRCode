//
//  LoginViewViewController.m
//  QRCode
//
//  Created by 863hy on 15/6/12.
//  Copyright (c) 2015年 com.xxxxxx. All rights reserved.
//

#import "LoginViewViewController.h"
#import "DimCodeScanViewController.h"
#import "LableHandle.h"
@interface LoginViewViewController ()

@end
#define  ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define  ScreenHeight  [[UIScreen mainScreen] bounds].size.height
@implementation LoginViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame =CGRectMake(20, 100, ScreenWidth-20, 40);
    [leftBtn setBackgroundColor:[UIColor grayColor]];
    [leftBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
    [leftBtn addTarget:self action: @selector(scanQRCode) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    UILabel * versionLab=[[UILabel alloc]init];
    versionLab.frame=CGRectMake(20,150, self.view.frame.size.width-20, 30);
    versionLab.font = [UIFont systemFontOfSize:16];
    versionLab.backgroundColor=[UIColor clearColor];
    versionLab.textAlignment=NSTextAlignmentCenter;
    versionLab.numberOfLines = 0;
    versionLab.text=[NSString stringWithFormat:@"扫描结果："];
    [self.view addSubview:versionLab];
    
    cellTitleLabel=[LableHandle createHorTitleLable:@"" height:0 textColor:[UIColor blackColor] fontSize:16];
    cellTitleLabel.frame=CGRectMake(0, 180, cellTitleLabel.frame.size.width, cellTitleLabel.frame.size.height);
    [self.view addSubview:cellTitleLabel];

}
#pragma 二维码
-(void) scanQRCode
{
    
        DimCodeScanViewController *dimCode=[[DimCodeScanViewController alloc]init];
        dimCode.delegate=self;
        // [self.view addSubview:dimCode.view];
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
            
            dimCode.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }else{
            
            self.modalPresentationStyle=UIModalPresentationCurrentContext;
            
        }
        
        [self presentViewController:dimCode animated:YES completion:nil];
        
        
   
}
//DimCodeScanDelegate
-(void)DimCodeScanCalendar:(NSString *)dimCodeString
{
    cellTitleLabel=[LableHandle createHorAndVerTitleLable:dimCodeString sizeWidth:ScreenWidth height:0 fontSize:16];
    cellTitleLabel.frame=CGRectMake(0, 180, cellTitleLabel.frame.size.width, cellTitleLabel.frame.size.height);
    
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
