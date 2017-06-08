//
//  IPAPatchScript.h
//  IPAPatch
//
//  Created by  on 07/06/2017.
//  Copyright © 2017 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPAPatchScript : NSObject

+ (instancetype) shareInstance ;

- (void) loadWax;

- (BOOL) saveScript : (NSData *)content filename : (NSString *) filename;

- (void) loadFile: (NSString *)filename;

- (void) loadScript: (NSString *)script;

@end
