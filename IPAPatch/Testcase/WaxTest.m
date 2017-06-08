//
//  WaxTest.m
//  IPAPatch
//
//  Created by 吴昕 on 03/06/2017.
//  Copyright © 2017 Weibo. All rights reserved.
//

#import "WaxTest.h"

static WaxTest * sWaxTestInstance = nil;
@implementation WaxTest

+ (instancetype) shareInstance {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        if (sWaxTestInstance == nil) {
            sWaxTestInstance = [[WaxTest alloc] init];
        }
    });
    return sWaxTestInstance;
}



@end
