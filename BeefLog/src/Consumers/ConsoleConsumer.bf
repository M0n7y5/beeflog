using BeefLog.Interfaces;
using BeefLog.Types;
using BeefLog.Formatters;
using System;
namespace BeefLog.Consumers
{
	class ConsoleConsumer : ILogConsumer
	{
		private readonly ILoggerFormatter _formatter;
		private bool isColored = false;

		[CLink, CallingConvention(.Stdcall)]
		static extern Windows.IntBool SetConsoleMode(Windows.Handle hConsoleOutput, uint32 dwMode);

		public static this()
		{
			let handle = Console.[Friend]GetStdHandle(Console.STD_OUTPUT_HANDLE);

			// ENABLE_VIRTUAL_TERMINAL_INPUT
			var cc = SetConsoleMode(handle, 0x0004 | 0x0001);
			var errr = Windows.GetLastError();

			let handleIn = Console.[Friend]GetStdHandle(Console.STD_INPUT_HANDLE);
			cc = SetConsoleMode(handleIn, 0x0200 | 0x0001);
			errr = Windows.GetLastError();
		}

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
			Console.WriteLine(_formatter.ApplyFormat(message, .. scope .()));
		}
	}
}
