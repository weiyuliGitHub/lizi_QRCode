//
//  LableHandle.m
//  EDP3.0_IOS8
//
//  Created by xcy on 14-10-28.
//  Copyright (c) 2014年 xcysoft. All rights reserved.
//

#import "LableHandle.h"

@interface LableHandle ()

@end

@implementation LableHandle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#define UILable自动伸展
/******
 处理标题。横向无限延伸
 ******/
+(UILabel *)createHorTitleLable:(NSString *)titleString height:(float)height textColor:(UIColor *)color fontSize:(int)fontSize
{
    UILabel *titleLab=[[UILabel alloc]init];
    
    UIFont *font = [UIFont fontWithName:@"Arial" size:fontSize];
    [titleLab setNumberOfLines:1];
    //size设置文字能容纳的最多字节数
    CGSize labelsize = [titleString sizeWithFont:font constrainedToSize:CGSizeMake(600,25345) lineBreakMode:NSLineBreakByWordWrapping];
    [titleLab setFrame:CGRectMake(0,height, labelsize.width,39)];
    titleLab.text = titleString;
    titleLab.font=font;
    titleLab.lineBreakMode=NSLineBreakByCharWrapping;//保留边界文字
    titleLab.textColor=color;
    titleLab.backgroundColor=[UIColor clearColor];
    
    return titleLab;
}
/******
 处理标题内容。横向竖向无限延伸
 ******/
+(UILabel *)createHorAndVerTitleLable:(NSString *)titleString sizeWidth:(float)width height:(float)height fontSize:(int)fontSize
{
    UILabel *titleLab=[[UILabel alloc]init];
    UIFont *font = [UIFont fontWithName:@"Arial" size:fontSize];
    [titleLab setNumberOfLines:0];
    //size设置文字能容纳的最多字节数
    CGSize labelsize = [titleString sizeWithFont:font constrainedToSize:CGSizeMake(width,25345) lineBreakMode:NSLineBreakByWordWrapping];
    [titleLab setFrame:CGRectMake(0,height,width ,labelsize.height)];
    titleLab.text = titleString;
    titleLab.font=font;
    //titleLab.lineBreakMode=NSLineBreakByCharWrapping;//保留边界文字
    titleLab.backgroundColor=[UIColor clearColor];
    return titleLab;
}
/******
 处理标题内容。坐标横向竖向无限延伸
 ******/
+(UILabel *)createHorAndVerTitleLable:(NSString *)titleString originX:(float)originX sizeWidth:(float)width height:(float)height fontSize:(int)fontSize
{
    UILabel *titleLab=[[UILabel alloc]init];
    UIFont *font = [UIFont fontWithName:@"Arial" size:fontSize];
    [titleLab setNumberOfLines:0];
    //size设置文字能容纳的最多字节数
    CGSize labelsize = [titleString sizeWithFont:font constrainedToSize:CGSizeMake(width,25345) lineBreakMode:NSLineBreakByWordWrapping];
    [titleLab setFrame:CGRectMake(originX,height,width ,labelsize.height)];
    titleLab.text = titleString;
    titleLab.font=font;
    //titleLab.lineBreakMode=NSLineBreakByCharWrapping;//保留边界文字
    titleLab.backgroundColor=[UIColor clearColor];
    return titleLab;
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
