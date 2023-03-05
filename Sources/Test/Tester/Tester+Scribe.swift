import Scribe

extension Tester {
    public typealias PluginPayload = Scribe.PluginPayload
    public typealias Message = Scribe.Message
    public typealias Level = Scribe.Level
    public typealias Metadata = Scribe.Metadata

    /// Logs a message with the trace log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - metadata: Optional metadata to be included with the log message.
    ///   - source: Optional source information to be included with the log message.
    /// - Returns: A task representing the log operation.
    @discardableResult
    public func logTrace(
        _ message: Message,
        metadata: Metadata? = nil,
        source: String? = nil
    ) -> Task<Void, Error> {
        scribe.trace(
            message,
            metadata: metadata,
            source: source
        )
    }

    /// Logs a message with the debug log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - metadata: Optional metadata to be included with the log message.
    ///   - source: Optional source information to be included with the log message.
    /// - Returns: A task representing the log operation.
    @discardableResult
    public func logDebug(
        _ message: Message,
        metadata: Metadata? = nil,
        source: String? = nil
    ) -> Task<Void, Error> {
        scribe.debug(
            message,
            metadata: metadata,
            source: source
        )
    }

    /// Logs a message with the info log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - metadata: Optional metadata to be included with the log message.
    ///   - source: Optional source information to be included with the log message.
    /// - Returns: A task representing the log operation.
    @discardableResult
    public func logInfo(
        _ message: Message,
        metadata: Metadata? = nil,
        source: String? = nil
    ) -> Task<Void, Error> {
        scribe.info(
            message,
            metadata: metadata,
            source: source
        )
    }

    /// Logs a message with the notice log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - metadata: Optional metadata to be included with the log message.
    ///   - source: Optional source information to be included with the log message.
    /// - Returns: A task representing the log operation.
    @discardableResult
    public func logNotice(
        _ message: Message,
        metadata: Metadata? = nil,
        source: String? = nil
    ) -> Task<Void, Error> {
        scribe.notice(
            message,
            metadata: metadata,
            source: source
        )
    }

    /// Logs a message with the warning log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - metadata: Optional metadata to be included with the log message.
    ///   - source: Optional source information to be included with the log message.
    /// - Returns: A task representing the log operation.
    @discardableResult
    public func logWarning(
        _ message: Message,
        metadata: Metadata? = nil,
        source: String? = nil
    ) -> Task<Void, Error> {
        scribe.warning(
            message,
            metadata: metadata,
            source: source
        )
    }

    /// Logs a message with the error log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - metadata: Optional metadata to be included with the log message.
    ///   - source: Optional source information to be included with the log message.
    /// - Returns: A task representing the log operation.
    @discardableResult
    public func logError(
        _ message: Message,
        metadata: Metadata? = nil,
        source: String? = nil
    ) -> Task<Void, Error> {
        scribe.error(
            message,
            metadata: metadata,
            source: source
        )
    }

    /// Logs a message with the critical log level.
    ///
    /// - Parameters:
    ///   - message: The message to be logged.
    ///   - metadata: Optional metadata to be included with the log message.
    ///   - source: Optional source information to be included with the log message.
    /// - Returns: A task representing the log operation.
    @discardableResult
    public func logCritical(
        _ message: Message,
        metadata: Metadata? = nil,
        source: String? = nil
    ) -> Task<Void, Error> {
        scribe.critical(
            message,
            metadata: metadata,
            source: source
        )
    }
}
