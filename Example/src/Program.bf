using System;
using BeefLog;
using BeefLog.Consumers;
using BeefLog.Formatters;
using System.Threading;
using BeefLog.Attributes;
namespace Example
{
	class Program
	{
		[LogExecutionTime(.Info)]
		public static void TestExecTime()
		{
			Thread.Sleep(5000);
		}

		public static int Main(String[] args)
		{
			Logger.ConsumerManager
				.AddConsumer(new ConsoleConsumer(new MinimalFormatter() { Colored = true }))
				.AddConsumer(new DebugConsumer());

			L.Log(.Info, "Hello from BeefLog");
			L.Debug("Sheeeeeeeeeesh");
			L.Success("Sheeeeeeeeeesh");
			L.Info("Sheeeeeeeeeesh");
			L.Error("Sheeeeeeeeeesh");
			L.Fatal("Sheeeeeeeeeesh");
			//L.Exception("Sheeeeeeeeeesh");

			TestExecTime();
			Console.Read();
			return 0;
		}

	}
}