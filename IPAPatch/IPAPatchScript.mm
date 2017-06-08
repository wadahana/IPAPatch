//
//  IPAPatchScript.m
//  IPAPatch
//
//  Created by wadahana on 07/06/2017.
//  Copyright © 2017. All rights reserved.
//

#import "IPAPatchScript.h"
extern "C" {
#import "wax/wax.h"
#import "wax/wax_http.h"
#import "wax/wax_json.h"
#import "wax/wax_xml.h"
#import "wax/wax_filesystem.h"
};


static IPAPatchScript * sInstance = nil;
@implementation IPAPatchScript

+ (instancetype) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[IPAPatchScript alloc] init];
    });
    return sInstance;
}

- (instancetype) init {
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (void) loadWax {
    wax_start(nil, luaopen_wax_http, luaopen_wax_json, luaopen_wax_xml, luaopen_wax_filesystem, nil);
}

- (void) loadFile: (NSString *)filename {
    NSString * path = [self scriptDirection];
    if (path) {
        NSString * fullPath = [path stringByAppendingPathComponent:filename];
        wax_runLuaFile([fullPath UTF8String]);
    }
}

- (void) loadScript: (NSString *)script {
    if (script && [script length] > 0) {
        wax_runLuaString([script UTF8String]);
    }
}

- (BOOL) saveScript : (NSData *)content filename : (NSString *) filename {
    BOOL result = NO;
    NSString * path = [self scriptDirection];
    if (path) {
        NSString * fullPath = [path stringByAppendingPathComponent:filename];
        result = [content writeToFile:fullPath atomically:YES];
    }
    return result;
}

- (NSString *) scriptDirection {
    NSError * error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * scriptPath = [docPath stringByAppendingPathComponent:@"WspxScript"];
    BOOL dir = NO;
    BOOL result = [fileManager fileExistsAtPath:scriptPath isDirectory:&dir];
    if (result) {
        if (dir) {
            return scriptPath;
        }
        [fileManager removeItemAtPath:scriptPath error: &error];
    }
    if (!error) {
        [fileManager createDirectoryAtPath:scriptPath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    if (error) {
        NSLog(@"create script direction %@ fail, %@\n", scriptPath, error);
        scriptPath = nil;
    }
    return scriptPath;
}

@end
