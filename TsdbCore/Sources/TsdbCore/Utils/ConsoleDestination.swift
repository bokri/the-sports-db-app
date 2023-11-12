//
//  ConsoleDestination.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import Foundation
import OSLog

/**
 An internal log destination that logs messages to the console in the `Logger` utility.

 The `ConsoleDestination` is a built-in log destination that allows you to log messages to the console in the DEBUG mode. It conforms to the `LogDestination` protocol and implements methods for different log levels, including debug, warning, and error.

 - Note: The `ConsoleDestination` is intended for debugging and development purposes. It logs messages to the console when the app is running in DEBUG mode.

 # See Also:
 - `Logger`: The logging utility that uses log destinations.
 - `LogDestination`: The protocol for custom log destinations.

 For more information on logging with the `ConsoleDestination` and custom log destinations, refer to the `Logger` class documentation or the README file.

 */
internal class ConsoleDestination: LogDestination {
    internal init() {
    }

    internal func debug(_ message: String) {
        #if DEBUG
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "TMDB")
        os_log("%{public}@", log: log, type: .debug, message)
        #endif
    }

    internal func warning(_ message: String) {
        #if DEBUG
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "TMDB")
        os_log("%{public}@", log: log, type: .fault, message)
        #endif
    }

    internal func errorMessage(_ message: String, _ file: String, _ function: String, _ line: Int) {
        #if DEBUG
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "TMDB")
        os_log("%{public}@", log: log, type: .error, message)
        #endif
    }

    internal func error(_ error: Error, _ file: String, _ function: String, _ line: Int) {
        #if DEBUG
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "TMDB")
        os_log("%{public}@", log: log, type: .error, error.localizedDescription)
        #endif
    }
}
