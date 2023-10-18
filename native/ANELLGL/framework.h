#pragma once

#define WIN32_LEAN_AND_MEAN             // 从 Windows 头文件中排除极少使用的内容
// Windows 头文件
#include <windows.h>

#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <Windows.h>
#include <tchar.h>

#include <Shlwapi.h>
#include <wchar.h> 
#include <locale.h>

#include <iostream>
#include <fstream>
#include <vector>
#include <random>
#include <map>
#include <type_traits>

#include <chrono>


#include "FlashRuntimeExtensions.h"

#include <LLGL/LLGL.h>
#include <LLGL/Utils/TypeNames.h>
#include <LLGL/Utils/Utility.h>
#include <LLGL/Utils/VertexFormat.h>
#include <LLGL/Utils/Parse.h>
#include <LLGL/Container/Strings.h>
#include <LLGL/Container/ArrayView.h>
#include <LLGL/Platform/Platform.h>
#include <LLGL/Platform/NativeHandle.h>

//#include <Gauss/Gauss.h>

#include "AsToLLGL.h"