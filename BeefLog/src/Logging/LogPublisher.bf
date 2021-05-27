using BeefLog.Interfaces;
using BeefLog.Types;
using System.Collections;
using System;
using BeefLog.Consumers;


namespace BeefLog.Logging
{
	class LogPublisher : ILogConsumerManager, ILogPublisher
	{
		private List<ILogConsumer> _consumers;

		public this()
		{
			_consumers = new List<ILogConsumer>();
		}

		public ~this()
		{
			DeleteContainerAndItems!(_consumers);
		}

		public ILogConsumerManager AddConsumer(ILogConsumer logConsumer)
		{
			Runtime.Assert(logConsumer != null);

			_consumers.Add(logConsumer);

			return this;
		}

		public ILogConsumerManager AddConsumer(ILogConsumer logConsumer, LogPredicate filter)
		{
			Runtime.Assert(logConsumer != null);
			Runtime.Assert(filter != null);

			_consumers.Add(new FilteredConsumer(logConsumer, filter));

			return this;
		}

		public bool RemoveConsumer(ILogConsumer logConsumer)
		{
			return _consumers.Remove(logConsumer);
		}

		public void Publish(LogMessage message)
		{
			for (let consumer in _consumers)
				consumer.Consume(message);
		}
	}
}
