//
//  LableHandle.h
//  EDP3.0_IOS8
//
//  Created by xcy on 14-10-28.
//  Copyright (c) 2014年 xcysoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LableHandle : UIViewController
/******
 处理标题。横向无限延伸
 ******/
+(UILabel *)createHorTitleLable:(NSString *)titleString height:(float)height textColor:(UIColor *)color fontSize:(int)fontSize;
/******
 处理标题内容。横向竖向无限延伸
 ******/
+(UILabel *)createHorAndVerTitleLable:(NSString *)titleString sizeWidth:(float)width height:(float)height fontSize:(int)fontSize;


/******
 处理标题内容。坐标X横向竖向无限延伸
 ******/
+(UILabel *)createHorAndVerTitleLable:(NSString *)titleString originX:(float)originX sizeWidth:(float)width height:(float)height fontSize:(int)fontSize
;
@end


