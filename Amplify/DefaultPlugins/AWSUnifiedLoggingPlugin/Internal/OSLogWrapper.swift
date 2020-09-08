//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
#if canImport(os)
import os.log
#endif

final class OSLogWrapper: Logger {
    private var _osLog: Any? = nil
    
    @available(iOS 10.0, *)
    private var osLog: OSLog {
        return _osLog as! OSLog
    }
    

    var getLogLevel: () -> LogLevel

    public var logLevel: LogLevel {
        get {
            getLogLevel()
        }
        set {
            getLogLevel = { newValue }
        }
    }

    @available(iOS 10.0, *)
    init(osLog: OSLog, getLogLevel: @escaping () -> LogLevel) {
        self._osLog = osLog
        self.getLogLevel = getLogLevel
    }
    
    init(getLogLevel: @escaping () -> LogLevel) {
        self.getLogLevel = getLogLevel
    }

    public func error(_ message: @autoclosure () -> String) {
        guard #available(iOS 10.0, *) else {
            return
        }
        
        // Always logged, no conditional check needed
        os_log("%@",
               log: osLog,
               type: OSLogType.error,
               message())
    }

    public func error(error: Error) {
        guard #available(iOS 10.0, *) else {
            return
        }
        
        // Always logged, no conditional check needed
        os_log("%@",
               log: osLog,
               type: OSLogType.error,
               error.localizedDescription)
    }

    public func warn(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.warn.rawValue else {
            return
        }
        
        guard #available(iOS 10.0, *) else {
            return
        }
        
        os_log("%@",
               log: osLog,
               type: OSLogType.info,
               message())
    }
    
    public func info(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.info.rawValue else {
            return
        }
        
        guard #available(iOS 10.0, *) else {
            return
        }
        
        os_log("%@",
               log: osLog,
               type: OSLogType.info,
               message())
    }

    public func debug(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.debug.rawValue else {
            return
        }
        
        guard #available(iOS 10.0, *) else {
            return
        }
        
        os_log("%@",
               log: osLog,
               type: OSLogType.debug,
               message())
    }

    public func verbose(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.verbose.rawValue else {
            return
        }
        
        guard #available(iOS 10.0, *) else {
            return
        }

        os_log("%@",
               log: osLog,
               type: OSLogType.debug,
               message())
    }
}
