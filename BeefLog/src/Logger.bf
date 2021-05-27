using BeefLog.Interfaces;
using System;
using BeefLog.Enums;
using BeefLog.Logging;
using BeefLog.Types;
using BeefLog;

static {
	/// Logger class in global namespace
	typealias L = Logger;
}

namespace BeefLog
{
	public static class Logger : ILogger
	{
		private static readonly LogPublisher LogPublisher;
		private static readonly Level _defaultLevel = .Info;

		public static ILogConsumerManager ConsumerManager
		{
			get => LogPublisher;
		}

		public static this()
		{
			LogPublisher = new LogPublisher();
		}

		public static ~this()
		{
			delete LogPublisher;
		}

		public static void Log(Level level, String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			var msg = LogMessage(.Now, level, message, className, callingMethod, lineNumber);
			LogPublisher.Publish(msg);
		}

		public static void Debug(String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			Log(.Debug, message, className, callingMethod, lineNumber);
		}

		public static void Success(String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			Log(.Success, message, className, callingMethod, lineNumber);
		}

		public static void Info(String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			Log(.Info, message, className, callingMethod, lineNumber);
		}

		public static void Warning(String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			Log(.Warning, message, className, callingMethod, lineNumber);
		}

		public static void Error(String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			Log(.Error, message, className, callingMethod, lineNumber);
		}

		public static void Fatal(String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			Log(.Fatal, message, className, callingMethod, lineNumber);
		}

		[Obsolete("This log level is not implemented yet", true)]
		public static void Exception(String message, String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName, int lineNumber = Compiler.CallerLineNum)
		{
			Log(.Exception, message, className, callingMethod, lineNumber);
		}
	}
}
