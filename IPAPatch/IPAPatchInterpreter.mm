//
//  IPAPatchInterpreter.m
//  IPAPatch
//
//  Created by wadahana on 07/06/2017.
//  Copyright © 2017. All rights reserved.
//

#import "IPAPatchInterpreter.h"
#import "WspxLogger.h"

extern "C" {
#import "wax/wax.h"
#import "wax/wax_http.h"
#import "wax/wax_json.h"
#import "wax/wax_xml.h"
#import "wax/wax_filesystem.h"
};


static IPAPatchInterpreter * sInstance = nil;

@interface IPAPatchInterpreter () 


@end

@implementation IPAPatchInterpreter {
    NSString * _rootDirectory;
}

+ (instancetype) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[IPAPatchInterpreter alloc] init];
    });
    return sInstance;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        _rootDirectory = nil;
    }
    return self;
}

- (void) loadWax {
    wax_start(nil, luaopen_wax_http, luaopen_wax_json, luaopen_wax_xml, luaopen_wax_filesystem, nil);
    wax_runLuaString("WSPX:enableDebug(true)\n WSPX:start()\n print 'wax start'\n");
}

- (void) loadJsPatch {

}

- (BOOL) uploadScriptFile: (NSString *) filename script:(NSData *)content {
    BOOL result = NO;
    NSString * path = [self rootDirectory];
    if (path) {
        NSString * fullPath = [path stringByAppendingPathComponent:filename];
        result = [content writeToFile:fullPath atomically:YES];
    }
    return result;
}

- (void) runScriptFile: (NSString *)filename {
    NSString * path = [self rootDirectory];
    if (path) {
        NSString * fullPath = [path stringByAppendingPathComponent:filename];
        if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath]) {
            wax_runLuaFile([fullPath UTF8String]);
        }
    }
    return;
}

- (void) runLuaScript: (NSString *)script {
    if (script && [script length] > 0) {
        wax_runLuaString([script UTF8String]);
    }
}

- (void) runJavaScript: (NSString *)script {

}


- (NSString *) rootDirectory {
    if (_rootDirectory) {
        return _rootDirectory;
    }
    NSError * error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * scriptPath = [docPath stringByAppendingPathComponent:@"WspxScript"];
    BOOL dir = NO;
    BOOL result = [fileManager fileExistsAtPath:scriptPath isDirectory:&dir];
    if (result) {
        if (dir) {
            _rootDirectory = scriptPath;
            return _rootDirectory;
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
    _rootDirectory = scriptPath;
    return scriptPath;
}

@end
