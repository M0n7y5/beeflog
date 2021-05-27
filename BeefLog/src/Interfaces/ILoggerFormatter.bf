using BeefLog.Types;
using System;
namespace BeefLog.Interfaces
{
	interface ILoggerFormatter
	{
		void ApplyFormat(LogMessage logMessage, String formatted);
	}
}
