//
//  KJSchemesTool.m
//  KJSchemesDemo
//
//  Created by 杨科军 on 2019/10/16.
//  Copyright © 2019 杨科军. All rights reserved.
//

#import "KJSchemesTool.h"

@implementation KJSchemesTool

/**跳转到指定应用程序
 
@param schemes 白名单 LSApplicationQueriesSchemes - AppDemo2注册的 URL
@param appid   AppID - AppDemo2对应的苹果商店id
@param parameter 需要传递的参数，接收方 xxx=123&A=a 接收样式如此
*/
+ (void)kj_schemesWithLSApplicationQueriesSchemes:(NSString*)schemes AppID:(NSString*)appid Parameter:(NSDictionary*)parameter{
//    NSString *json = [self kj_convertToJsonData:dict];
    NSString *json = [self kj_analysisWithParameter:parameter];
    NSString *str = [NSString stringWithFormat:@"%@://%@",schemes,json];
    NSURL *urlLocal = [NSURL URLWithString:str];
    // 判断是否可以启动该URL
    if([[UIApplication sharedApplication] canOpenURL:urlLocal]){
        [[UIApplication sharedApplication] openURL:urlLocal options:@{} completionHandler:nil];
    }else{
        /// 跳到 AppStore 某个 App
        NSURL *urlAppStore = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/tie-lu12306/id%@?mt=8",appid]];
        [[UIApplication sharedApplication] openURL:urlAppStore options:@{} completionHandler:nil];
    }
}
/// 解析字典参数 - 拼接
+ (NSString*)kj_analysisWithParameter:(NSDictionary*)dict{
    __block NSString *fullString = @"";
    NSInteger count = dict.allKeys.count;
    [dict.allKeys enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string = @"";
        if (idx<count-1) {
            string = [NSString stringWithFormat:@"%@=%@&",obj,dict[obj]];
        }else{
            string = [NSString stringWithFormat:@"%@=%@",obj,dict[obj]];
        }
        fullString = [fullString stringByAppendingString:string];
    }];
    return fullString;
}

/// 字典转JSON字符串
+ (NSString *)kj_convertToJsonData:(NSDictionary *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return json;
}

@end
