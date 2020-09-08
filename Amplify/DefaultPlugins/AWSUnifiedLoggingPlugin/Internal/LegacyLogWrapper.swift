//
//  LegacyLogWrapper.swift
//  Editions
//
//  Created by Aristote Diasonama on 2020-09-04.
//  Copyright © 2020 Mirego. All rights reserved.
//

final class LegacyLogWrapper: Logger {

    var getLogLevel: () -> LogLevel

    public var logLevel: LogLevel {
        get {
            getLogLevel()
        }
        set {
            getLogLevel = { newValue }
        }
    }

    init(getLogLevel: @escaping () -> LogLevel) {
        self.getLogLevel = getLogLevel
    }

    public func error(_ message: @autoclosure () -> String) {
        // Always logged, no conditional check needed
        
//        os_log("%@",
//               log: osLog,
//               type: OSLogType.error,
//               message())
    }

    public func error(error: Error) {
        // Always logged, no conditional check needed
//        os_log("%@",
//               log: osLog,
//               type: OSLogType.error,
//               error.localizedDescription)
    }

    public func warn(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.warn.rawValue else {
            return
        }

//        os_log("%@",
//               log: osLog,
//               type: OSLogType.info,
//               message())
    }

    public func info(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.info.rawValue else {
            return
        }

//        os_log("%@",
//               log: osLog,
//               type: OSLogType.info,
//               message())
    }

    public func debug(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.debug.rawValue else {
            return
        }

//        os_log("%@",
//               log: osLog,
//               type: OSLogType.debug,
//               message())
    }

    public func verbose(_ message: @autoclosure () -> String) {
        guard logLevel.rawValue >= LogLevel.verbose.rawValue else {
            return
        }

//        os_log("%@",
//               log: osLog,
//               type: OSLogType.debug,
//               message())
    }
}
