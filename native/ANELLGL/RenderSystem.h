#pragma once

#include "ANEUtils.h"


class RenderSystem
{
public:
    int  Load(std::string moduleName);
    void UnLoad();

    bool CreateSwapChain(LLGL::SwapChainDescriptor swapChainDesc);

    FREObject CreateBuffer(FREObject Air_vertexBufferDesc,FREObject Air_vertices);

    void addToNativeWindow(FREObject AirWindow,int x,int y);

    LLGL::RenderSystemPtr native;
    LLGL::SwapChain* swapChain;
private:
    LLGL::Report report;
    HWND hwNative;
};

