using BeefLog.Interfaces;
using BeefLog.Types;
using System;
namespace BeefLog.Formatters
{
	class MinimalFormatter : ILoggerFormatter
	{
		public void ApplyFormat(LogMessage logMessage, String formatted)
		{
			formatted
				.AppendF("{0:dd.MM.yyyy HH:mm:ss} {1}: {2}",
				logMessage.DateTime,
				logMessage.Level,
				logMessage.Text);
		}
	}
}
