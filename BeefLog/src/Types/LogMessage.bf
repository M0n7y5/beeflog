using System;
using BeefLog.Enums;
namespace BeefLog.Types
{
	struct LogMessage
		: this(
		DateTime DateTime,
		Level Level,
		StringView Text,
		StringView CallingClass,
		StringView CallingMethod,
		int LineNumber)
	{
	}
}
