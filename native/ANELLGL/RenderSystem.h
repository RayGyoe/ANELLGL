#pragma once

#include "ANEUtils.h"


class RenderSystem
{
public:
    int  Load(std::string moduleName);
    void UnLoad();

    FREObject CreateSwapChain(LLGL::SwapChainDescriptor swapChainDesc);

    FREObject CreateBuffer(FREObject Air_vertexBufferDesc, FREObject Air_vertices); 
    FREObject CreateShader(FREObject Air_shaderDesc);
    FREObject CreatePipelineState(FREObject Air_graphicsPipelineDesc);

    FREObject CreateCommandBuffer(FREObject Air_commandBufferDesc);
    
    void addToNativeWindow(FREObject AirWindow,int x,int y);

    LLGL::RenderSystemPtr native;
    LLGL::SwapChain* swapChain;

    int rendererIndex;
private:
    LLGL::Report report;
    HWND hwNative;
    
};

