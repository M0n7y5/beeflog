using BeefLog.Types;
using System;
using BeefLog.Interfaces;
namespace BeefLog.Formatters
{
	class DefaultFormatter : ILoggerFormatter
	{
		public void ApplyFormat(LogMessage logMessage, String formatted)
		{
			formatted
				.AppendF("{0:dd.MM.yyyy HH:mm:ss}: {1} [line: {2} {3} -> {4}]: {5}",
				logMessage.DateTime,
				logMessage.Level,
				logMessage.LineNumber,
				logMessage.FileName,
				logMessage.CallingMethod,
				logMessage.Text);
		}
	}
}
