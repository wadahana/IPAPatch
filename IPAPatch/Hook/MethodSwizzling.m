//
//  MethodSwizzling.m
//  AppProxy
//
//  Created by wadahana on 04/05/2017.
//  Copyright © 2017 . All rights reserved.
//

#import <objc/objc.h>
#import <objc/runtime.h>

#import <Foundation/Foundation.h>


void exchangeMethod(Class aClass, SEL oldSEL, SEL newSEL)
{
    Method oldMethod = class_getInstanceMethod(aClass, oldSEL);
    assert(oldMethod);
    Method newMethod = class_getInstanceMethod(aClass, newSEL);
    assert(newMethod);
    method_exchangeImplementations(oldMethod, newMethod);
}

void exchangeMethodClass(Class aClass, SEL oldSEL, SEL newSEL)
{
    Method oldMethod = class_getClassMethod(aClass, oldSEL);
    assert(oldMethod);
    Method newMethod = class_getClassMethod(aClass, newSEL);
    assert(newMethod);
    method_exchangeImplementations(oldMethod, newMethod);
}
