using System;
using BeefLog;
using BeefLog.Consumers;
namespace Example
{
	class Program
	{
		public static int Main(String[] args)
		{
			Logger.ConsumerManager
				.AddConsumer(new ConsoleConsumer());

			L.Log(.Info, "Hello from BeefLog");

			Console.Read();
			return 0;
		}

	}
}