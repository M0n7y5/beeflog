using BeefLog.Enums;

namespace System
{
	extension ConsoleColor
	{
		public void GetSequence(String seq)
		{
			seq.Append(scope $"\x1B[{this.AnsiCode}m");
		}

		
	}
}
