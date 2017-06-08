//
//  OCTraceRemoteLogger.cpp
//  IPAPatch
//
//  Created by wadahana on 02/06/2017.
//  Copyright © 2017 . All rights reserved.
//

#include "OCTraceRemoteLogger.h"
#include "OCTraceUtils.h"
#include "WspxLogger.h"

OCTraceRemoteLogger::OCTraceRemoteLogger() {
    
}

OCTraceRemoteLogger::~OCTraceRemoteLogger() {
    
}

void OCTraceRemoteLogger::trace(OCTraceLoggerCallee & callee) {
    //    fprintf(stderr, "trace [%llu:%llu] [%s %s] -> depth(%d)\n",
    //            callee.m_process_id, callee.m_thread_id,
    //            callee.m_class_name.c_str(), callee.m_op_name.c_str(), callee.m_depth);

    std::string method = string_sprintf("[%s %s]", callee.m_class_name.c_str(), callee.m_op_name.c_str());
    TraceMessage("OCTrace", callee.m_thread_id, method.c_str(), callee.m_depth);
}
