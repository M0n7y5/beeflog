using BeefLog.Types;
namespace BeefLog.Interfaces
{
	interface ILogConsumer
	{
		void Consume(LogMessage message);
	}
}
