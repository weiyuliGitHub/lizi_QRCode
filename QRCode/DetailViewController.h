//
//  DetailViewController.h
//  QRCode
//
//  Created by 863hy on 15/6/12.
//  Copyright (c) 2015年 com.xxxxxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

