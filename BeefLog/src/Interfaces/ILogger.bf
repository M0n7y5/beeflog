using System;
using BeefLog.Enums;
namespace BeefLog.Interfaces
{
	interface ILogger
	{
		static void Log(
			Level level,
			String message,
			String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);

		static void Debug(
			String message,
			String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);

		static void Success(
			String message,
			String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);

		static void Info(
			String message,
			String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);

		static void Warning(
			String message,
			String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);

		static void Error(
			String message,
			String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);

		static void Fatal(
			String message,
			String className = Compiler.ModuleName,
			String callingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);


		// Not used yet
		static void Exception(
			String message,
			String className = Compiler.ModuleName,
			String allingMethod = Compiler.CallerMemberName,
			int lineNumber = Compiler.CallerLineNum);
	}
}
