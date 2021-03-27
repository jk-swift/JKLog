//
//  JKLog.m
//  JKLog
//
//  Created by Long on 2021/3/27.
//

#import "JKLog.h"
#import "lib/aloggerbase.h"
#import "pthread.h"

@implementation JKLogOptions

@end

///

@interface JKLog ()

@property (nonatomic, strong) JKLogOptions *options;

@end

@implementation JKLog

+ (JKLog *)shared
{
    static JKLog *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JKLog alloc] init];
    });
    return instance;
}

- (void)setupWithOptions:(JKLogOptions *)options
{
    _options = options;
    alogger_init((int)options.level,
                 [(options.path ?: @"") UTF8String],
                 [(options.filePrefix ?: @"") UTF8String]);
}

- (void)logWithLevel:(JKLogLevel)level tag:(NSString *)tag type:(JKLogType)type line:(int32_t)line desc:(NSString *)format, ...
{
    NSString *validTag = tag ?: @"";
    NSString *validModuleName = _options.moduleName ?: @"";
    
    va_list ap;
    va_start(ap, format);
    NSString *validLog = [[NSString alloc] initWithFormat:format arguments:ap] ?: @"";
    va_end(ap);
    
    uint64_t tid;
    pthread_threadid_np(NULL, &tid);
    
    switch (level) {
        case JKLogLevelVerbose:
            alogger_verbose([validTag UTF8String], (int)type, [validModuleName UTF8String], line, (int)tid, [validLog UTF8String]);
            break;
        case JKLogLevelDebug:
            alogger_debug([validTag UTF8String], (int)type, [validModuleName UTF8String], line, (int)tid, [validLog UTF8String]);
            break;
        case JKLogLevelInfo:
            alogger_info([validTag UTF8String], (int)type, [validModuleName UTF8String], line, (int)tid, [validLog UTF8String]);
            break;
        case JKLogLevelWarn:
            alogger_warn([validTag UTF8String], (int)type, [validModuleName UTF8String], line, (int)tid, [validLog UTF8String]);
            break;
        case JKLogLevelError:
            alogger_error([validTag UTF8String], (int)type, [validModuleName UTF8String], line, (int)tid, [validLog UTF8String]);
            break;
            
        default:
            alogger_test([validTag UTF8String], (int)type, [validModuleName UTF8String], line, (int)tid, [validLog UTF8String]);
            break;
    }
}

@end
