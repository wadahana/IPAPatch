//
//  IPAPatchEntry.m
//  IPAPatch
//
//  Created by wutian on 2017/3/17.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import "IPAPatchEntry.h"
#import "IPAPatchBypassAntiDebugging.h"
#import "OCTrace.h"

#import <UIKit/UIKit.h>


@implementation IPAPatchEntry

+ (void)load
{
    // For Example:
    dispatch_after(5*NSEC_PER_SEC, dispatch_get_main_queue(), ^{
    
    });
}

+ (void)for_example_showAlert
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // prevent anti debug
        [IPAPatchBypassAntiDebugging load];
        
        OCTraceInit();
        
    });
}

@end
