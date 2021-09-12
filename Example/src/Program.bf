using System;
using BeefLog;
using BeefLog.Consumers;
using BeefLog.Formatters;
namespace Example
{
	class Program
	{
		public static int Main(String[] args)
		{
			Logger.ConsumerManager
				.AddConsumer(new ConsoleConsumer(new MinimalFormatter()))
				.AddConsumer(new DebugConsumer());

			L.Log(.Info, "Hello from BeefLog");
			L.Error("Sheeeeeeeeeesh");

			Console.Read();
			return 0;
		}

	}
}