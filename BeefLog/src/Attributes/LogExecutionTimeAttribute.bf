using System;
using System.Reflection;
using BeefLog;
using BeefLog.Enums;

namespace BeefLog.Attributes
{
	[AttributeUsage(.Method)]
	public struct LogExecutionTimeAttribute : Attribute, IOnMethodInit,
		this(Level level = .Debug)
	{
		[Comptime]
		public void OnMethodInit(MethodInfo methodInfo, Self* prev)
		{
			let typeInstanceName = methodInfo.[Friend]mTypeInstance.GetFullName(.. scope .());
			let fullname = scope $"{typeInstanceName}.{methodInfo.Name}";

			let nameHash = (uint)fullname.GetHashCode();
			let timerExpr = scope $"""
        let __timer_{nameHash} = scope System.Diagnostics.Stopwatch(true);
        defer
        {{
            L.Log(.{level}, scope $"Scope {fullname} took {{__timer_{nameHash}.ElapsedMilliseconds}}ms.");
        }}
        """;


			Compiler.EmitMethodEntry(methodInfo, timerExpr);
		}
	}
}
