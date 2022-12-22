using System;
using BeefLog.Enums;
namespace BeefLog.Types
{
	struct LogMessage
		: this(
		DateTime DateTime,
		Level Level,
		StringView Text,
		StringView FileName,
		StringView CallingMethod,
		int LineNumber)
	{
	}
}
