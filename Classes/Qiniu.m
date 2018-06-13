//
//  QBMUtil.m
//  WeexEros
//
//  Created by qbm_ios on 2018/5/24.
//  Copyright © 2018年 qbm Company. All rights reserved.

#import "Qiniu.h"
#import <WeexPluginLoader/WeexPluginLoader.h>

WX_PlUGIN_EXPORT_MODULE(dateTimePicker, QBMDatePickerModule)
@implementation Qiniu
WX_EXPORT_METHOD(@selector(log))

+ (void)log
{
    NSLog(@"====>测试");
}
@end

