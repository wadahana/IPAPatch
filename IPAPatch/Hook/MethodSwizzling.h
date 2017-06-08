//
//  MethodSwizzling.h
//  IPAPatch
//
//  Created by wadahana on 08/06/2017.
//  Copyright © 2017 . All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef WspxMethodSwizzling_h
#define WspxMethodSwizzling_h


void exchangeMethod(Class aClass, SEL oldSEL, SEL newSEL);

void exchangeMethodClass(Class aClass, SEL oldSEL, SEL newSEL);

#endif /* WspxMethodSwizzling_h */
