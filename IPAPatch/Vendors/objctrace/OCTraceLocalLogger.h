//
//  OCTraceDumpLogger.h
//  IPAPatch
//
//  Created by wadahana on 01/06/2017.
//  Copyright © 2017 . All rights reserved.
//

#ifndef OCTraceDumpLogger_h
#define OCTraceDumpLogger_h

#include <sys/types.h>
#include <stdio.h>

#include <string>
#include <stack>
#include <map>
#include "OCTraceLogger.h"


class OCTraceDumpLogger : public OCTraceLogger {
public:
    OCTraceDumpLogger();
    ~OCTraceDumpLogger();
    
public:
    typedef std::stack<<#class _Tp#>>
    virtual void logBeforeCallee(intptr_t obj_ptr, intptr_t op_ptr);
    virtual void logAfterCallee(intptr_t obj_ptr, intptr_t op_ptr);
    
protected:
    
};

#endif /* OCTraceDumpLogger_h */
