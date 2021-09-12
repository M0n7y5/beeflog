using BeefLog.Interfaces;
using BeefLog.Types;
using BeefLog.Formatters;
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
			DebugConsumer.WriteLine(_formatter.ApplyFormat(message, .. scope .()));
		}
	}
}
