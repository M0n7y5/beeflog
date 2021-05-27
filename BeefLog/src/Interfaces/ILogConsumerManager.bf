using BeefLog.Types;
namespace BeefLog.Interfaces
{
	interface ILogConsumerManager
	{
		ILogConsumerManager AddConsumer(ILogConsumer logConsumer);
		ILogConsumerManager AddConsumer(ILogConsumer logConsumer, LogPredicate filter);

		bool RemoveConsumer(ILogConsumer logConsumer);
	}
}
