#pragma once
#include "pch.h"


extern "C"
{
	__declspec(dllexport) void ANELLGLExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);
	__declspec(dllexport) void ANELLGLExtFinalizer(void* extData);
}
