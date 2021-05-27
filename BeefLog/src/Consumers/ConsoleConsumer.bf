using BeefLog.Interfaces;
using BeefLog.Types;
using BeefLog.Formatters;
using System;
namespace BeefLog.Consumers
{
	class ConsoleConsumer : ILogConsumer
	{
		private readonly ILoggerFormatter _formatter;

		public this(ILoggerFormatter formatter)
		{
			_formatter = formatter;
		}

		public this() : this(new DefaultFormatter())
		{

		}

		~this()
		{
			delete _formatter;
		}

		public void Consume(LogMessage message)
		{
			Console.WriteLine(_formatter.ApplyFormat(message, .. scope .()));
		}
	}
}
