//
//  NSBundle+Hooked.m
//  IPAPatch
//
//  Created by 吴昕 on 08/06/2017.
//  Copyright © 2017 Weibo. All rights reserved.
//

#import "NSBundle+Hooked.h"
#import "MethodSwizzling.h"

//const static NSString * kFakeBundleIdentifier = @"com.PandaTV.Live-iPhone";
const static NSString * kFakeBundleIdentifier = @"tv.douyu.live";
//const static NSString * kFakeBundleIdentifier = @"com.tencent.xin";
@implementation NSBundle(Hooked)

- (NSDictionary<NSString *, id> *) hooked_infoDictionary {
    NSMutableDictionary<NSString *, id> * dict = [[self hooked_infoDictionary] mutableCopy];
    dict[(NSString *)kCFBundleIdentifierKey] = [kFakeBundleIdentifier copy];
    return dict;
}

- (NSString *) hooked_bundleIdentifier {
    NSString * bundleID = [kFakeBundleIdentifier copy];
    return bundleID;
}

+ (void) hook {
    
    exchangeMethod([NSBundle class],
                   @selector(infoDictionary),
                   @selector(hooked_infoDictionary));
    
    exchangeMethod([NSBundle class],
                   @selector(bundleIdentifier ),
                   @selector(hooked_bundleIdentifier));
}

@end
