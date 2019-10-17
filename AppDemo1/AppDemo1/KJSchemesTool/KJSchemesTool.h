//
//  KJSchemesTool.h
//  KJSchemesDemo
//
//  Created by 杨科军 on 2019/10/16.
//  Copyright © 2019 杨科军. All rights reserved.
//  一款App跳转都另一个App工具

/**
 1.在AppDemo2的info.plist当中URL Schemes注册 URL
 <key>CFBundleURLTypes</key>
 <array>
     <dict>
         <key>CFBundleURLSchemes</key>
         <array>
             <string>AppDemo2</string>
         </array>
     </dict>
 </array>

 2.AppDemo1添加白名单 LSApplicationQueriesSchemes - AppDemo2注册的 URL
 <key>LSApplicationQueriesSchemes</key>
 <array>
     <string>AppDemo2</string>
 </array>
 
 3.AppDemo1调用方法 kj_schemesWithLSApplicationQueriesSchemes
 
 4.在AppDemo2的AppDelegate当中实现该方法
 /// 重写 openURL 方法
 - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
     /// 打印收到的参数以及应用程序的 applicationkey
     NSLog(@"当前App被启动，下面是 跳转过来App 传递过来的 启动参数:\n%@",url.absoluteString);
     NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
     NSLog(@"sourceApplication:%@", sourceApplication);

     return YES;
 }
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KJSchemesTool : NSObject

/**跳转到指定应用程序
 
@param schemes 白名单 LSApplicationQueriesSchemes - AppDemo2注册的 URL
@param appid   AppID - AppDemo2对应的苹果商店id
@param parameter 需要传递的参数，接收方 xxx=123&A=a 接收样式如此
*/
+ (void)kj_schemesWithLSApplicationQueriesSchemes:(NSString*)schemes AppID:(NSString*)appid Parameter:(NSDictionary*)parameter;

@end

NS_ASSUME_NONNULL_END
