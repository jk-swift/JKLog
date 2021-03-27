//
//  JKLog.h
//  JKLog
//
//  Created by Long on 2021/3/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 日志级别
typedef enum {
    JKLogLevelVerbose = 0,
    JKLogLevelDebug, // Detailed information on the flow through the system.
    JKLogLevelInfo,  // Interesting runtime events (startup/shutdown), should be conservative and keep to a minimum.
    JKLogLevelWarn,  // Other runtime situations that are undesirable or unexpected, but not necessarily "wrong".
    JKLogLevelError, // Other runtime errors or unexpected conditions.
    JKLogLevelTest
} JKLogLevel;

/// 日志类型
typedef enum {
    JKLogTypeNormal  = 0,
    JKLogTypeApi     = 1
} JKLogType;

/**
 日志配置类
 */
@interface JKLogOptions : NSObject

@property (nonatomic, assign)   JKLogLevel   level;
@property (nonatomic, assign)   NSString    *path;
@property (nonatomic, assign)   NSString    *filePrefix;
@property (nonatomic, assign)   NSString    *moduleName;

@end

/**
 日志服务类
 */
@interface JKLog : NSObject

/**
 获取日志服务单例
 */
+ (JKLog *)shared;

/**
 配置日志服务
 @param options 日志配置类
 */
- (void)setupWithOptions:(JKLogOptions *)options;

/**
 打印日志
 @param level   日志级别
 @param tag        日志tag
 @param type    日志类型
 @param line    执行代码行数
 @param format  日志格式化字符串
 */
- (void)logWithLevel:(JKLogLevel)level
                 tag:(NSString *)tag
                type:(JKLogType)type
                line:(int32_t)line
                desc:(NSString *)format, ...;

- (instancetype)init NS_UNAVAILABLE;

@end

/**
 日志打印快捷方法
 */
#define JKLogDebug(frmt, ...)    [[JKLog shared] logWithLevel:JKLogLevelDebug tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeNormal line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define JKLogInfo(frmt, ...)     [[JKLog shared] logWithLevel:JKLogLevelInfo tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeNormal line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define JKLogWarn(frmt, ...)     [[JKLog shared] logWithLevel:JKLogLevelWarn tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeNormal line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define JKLogError(frmt, ...)    [[JKLog shared] logWithLevel:JKLogLevelError tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeNormal line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define JKLogTest(frmt, ...)     [[JKLog shared] logWithLevel:JKLogLevelTest tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeNormal line:__LINE__ desc:(frmt), ## __VA_ARGS__];

/**
 接口日志打印快捷方法
 */
#define ApiLogDebug(frmt, ...)    [[JKLog shared] logWithLevel:JKLogLevelDebug tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeApi line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define ApiLogInfo(frmt, ...)     [[JKLog shared] logWithLevel:JKLogLevelInfo tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeApi line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define ApiLogWarn(frmt, ...)     [[JKLog shared] logWithLevel:JKLogLevelWarn tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeApi line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define ApiLogError(frmt, ...)    [[JKLog shared] logWithLevel:JKLogLevelError tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeApi line:__LINE__ desc:(frmt), ## __VA_ARGS__];
#define ApiLogTest(frmt, ...)    [[JKLog shared] logWithLevel:JKLogLevelTest tag:[NSString stringWithFormat:@"%s", __FUNCTION__] type:JKLogTypeApi line:__LINE__ desc:(frmt), ## __VA_ARGS__];

NS_ASSUME_NONNULL_END
