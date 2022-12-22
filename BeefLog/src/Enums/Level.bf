using System;
namespace BeefLog.Enums
{
	enum Level
	{
		case Debug;
		case Info;
		case Success;
		case Warning;
		case Error;
		case Fatal;
		// Something bad happened and we want more info about what
		case Exception;


		public ConsoleColor Color
		{
			get
			{
				switch (this)
				{
				case .Debug: return .DarkGray;
				case .Info: return .Blue;
				case .Success: return .Green;
				case .Warning: return .Yellow;
				case .Error: return .Red;
				case .Fatal: return .Magenta;
				case .Exception: return .Cyan;
				default: return .Gray;
				}
			}
		}
	}
}
