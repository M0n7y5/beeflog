using BeefLog.Interfaces;
using BeefLog.Types;
namespace BeefLog.Consumers
{
	class FilteredConsumer : ILogConsumer
	{
		private readonly LogPredicate _filter;
		private readonly ILogConsumer _consumer;

		public this(ILogConsumer consumer, LogPredicate filter)
		{
			this._consumer = consumer;
			this._filter = filter;
		}

		public ~this()
		{
			delete _consumer;
		}

		public void Consume(LogMessage message)
		{
			if (_filter(message))
				_consumer.Consume(message);
		}
	}
}
