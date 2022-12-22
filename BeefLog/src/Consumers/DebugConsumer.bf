using BeefLog.Interfaces;
using BeefLog.Types;
using BeefLog.Formatters;
using System.Diagnostics;
namespace BeefLog.Consumers
{
	class DebugConsumer : ILogConsumer
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
			Debug.WriteLine(_formatter.ApplyFormat(message, .. scope .()));
		}
	}
}
