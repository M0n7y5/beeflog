using BeefLog.Interfaces;
using BeefLog.Types;
using System;
namespace BeefLog.Formatters
{
	class MinimalFormatter : ILoggerFormatter
	{
		ConsoleColor timeColor = .White;
		ConsoleColor levelColor = .DarkGray;
		ConsoleColor msgColor = .DarkGray;

		String msgTemplate = new .() ~ delete _;

		public bool Colored { get; set; } = false;

		public void ApplyFormat(LogMessage logMessage, String formatted)
		{
			if (Colored)
			{
				formatted.Append(timeColor.GetSequence(.. scope .()));
				formatted.Append(logMessage.DateTime.ToString(.. scope .(), "dd.MM.yyyy HH:mm:ss "));
				formatted.Append(logMessage.Level.Color.GetSequence(.. scope .()));
				formatted.Append(scope $"{logMessage.Level} ");
				formatted.Append(logMessage.Text);
			}
			else
			{
				formatted.Append(logMessage.DateTime.ToString(.. scope .(), "dd.MM.yyyy HH:mm:ss "));
				formatted.Append(scope $"{logMessage.Level} ");
				formatted.Append(logMessage.Text);
			}
		}
	}
}
