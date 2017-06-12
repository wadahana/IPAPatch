//
//  IPAPatchEntry.m
//  IPAPatch
//
//  Created by wutian on 2017/3/17.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cycript/Cycript.h"

#import "IPAPatchEntry.h"
#import "IPAPatchInterpreter.h"
#import "IPAPatchBypassAntiDebugging.h"
#import "OCTrace.h"
#import "OCTraceTest.h"
#import "WspxLogger.h"
#import "NSBundle+Hooked.h"

@implementation IPAPatchEntry

+ (void)load
{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        IPAPatchInterpreter * interpreter = [IPAPatchInterpreter shareInstance];
        
        [NSBundle hook];
        
        WspxLoggerStart(8899, 30, interpreter);
        
        NSLog(@"start wspx logger ....\n");
        
        [interpreter loadWax];
        // prevent anti debug
        [IPAPatchBypassAntiDebugging load];
        
//      CYListenServer(10086);
        
      OCTraceInit();
        
//     [[OCTraceTest shareInstance] test];
    });
}


@end
