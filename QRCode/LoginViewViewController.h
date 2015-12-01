//
//  LoginViewViewController.h
//  QRCode
//
//  Created by 863hy on 15/6/12.
//  Copyright (c) 2015年 com.xxxxxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DimCodeScanViewController.h"
@interface LoginViewViewController : UIViewController<DimCodeScanDelegate>
{
    UILabel *cellTitleLabel;
}
@end
