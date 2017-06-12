//
//  IPAPatchInterpreter.h
//  IPAPatch
//
//  Created by wadahana on 07/06/2017.
//  Copyright © 2017 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WspxLogger.h"

@interface IPAPatchInterpreter : NSObject<WspxLoggerDelegate>

+ (instancetype) shareInstance ;

- (void) loadWax;

- (BOOL) saveScript : (NSData *)content filename : (NSString *) filename;

- (void) runScriptFile: (NSString *)filename;

- (void) runScript: (NSString *)script;

- (NSString *) rootDirectory;

@end
