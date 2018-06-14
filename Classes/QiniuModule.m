//
//  QBMUtil.m
//  WeexEros
//
//  Created by qbm_ios on 2018/5/24.
//  Copyright © 2018年 qbm Company. All rights reserved.

#import "QiniuModule.h"
#import <QiniuSDK.h>
#import <WeexPluginLoader/WeexPluginLoader/WeexPluginLoader.h>

WX_PlUGIN_EXPORT_MODULE(qiniu, QiniuModule)

@implementation QiniuModule

WX_EXPORT_METHOD(@selector(uploadImage:callback:))

- (void)uploadImage:(NSDictionary *)info callback:(WXModuleCallback)callback
{
    NSString *token = [info valueForKey:@"token"];
    NSString *key = [info valueForKey:@"key"];
    NSString *path = [info valueForKey:@"path"];
    UIImage *getImage = [UIImage imageWithContentsOfFile:path];
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    NSData *data;
    if (UIImagePNGRepresentation(getImage) == nil){
        data = UIImageJPEGRepresentation(getImage, 0.8);
    } else {
        data = UIImagePNGRepresentation(getImage);
    }
    [upManager putData:data key:key token:token
              complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp)   {
                  NSMutableDictionary *result = @{@"status":@true,@"message":@"",@"data":resp};
                  callback(result);
              } option:nil];
}

@end

