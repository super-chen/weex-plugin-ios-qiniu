//
//  QBMUtil.m
//  WeexEros
//
//  Created by qbm_ios on 2018/5/24.
//  Copyright © 2018年 qbm Company. All rights reserved.

#import "QiniuModule.h"
#import <QiniuSDK.h>
#import <HappyDNS.h>
#import <WeexPluginLoader/WeexPluginLoader/WeexPluginLoader.h>
#import <UIImage+ImageCompress.h>

WX_PlUGIN_EXPORT_MODULE(qiniu, QiniuModule)

@implementation QiniuModule

WX_EXPORT_METHOD(@selector(uploadImage:callback:))

- (void)uploadImage:(NSDictionary *)info callback:(WXModuleCallback)callback
{
    QNConfiguration *config =[QNConfiguration  	build:^(QNConfigurationBuilder *builder) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:[QNResolver systemResolver]];
        QNDnsManager *dns = [[QNDnsManager alloc] init:array networkInfo:[QNNetworkInfo normal]];
        builder.zone = [[QNAutoZone alloc] initWithDns:dns];
    }];
    NSString *token = [info valueForKey:@"token"];
    NSString *key = [info valueForKey:@"key"];
    NSString *path = [info valueForKey:@"path"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    UIImage *getImage = [UIImage compressImage:image
                                        compressRatio:0.6f];

    NSData *data;
    if (UIImagePNGRepresentation(getImage) == nil){
        data = UIImageJPEGRepresentation(getImage, 1.0);
    } else {
        data = UIImagePNGRepresentation(getImage);
    }
    
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    [upManager putData:data key:key token:token
              complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp)   {
                  NSMutableDictionary *result = @{@"status":@true,@"message":@"",@"data":resp};
                  callback(result);
              } option:nil];
}

@end

