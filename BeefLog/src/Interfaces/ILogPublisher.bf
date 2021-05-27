using BeefLog.Types;
namespace BeefLog.Interfaces
{
	interface ILogPublisher
	{
		void Publish(LogMessage message);
	}
}
