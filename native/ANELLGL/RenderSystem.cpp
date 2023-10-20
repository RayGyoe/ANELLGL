#include "pch.h"
#include "RenderSystem.h"



int RenderSystem::Load(std::string moduleName)
{
    native = LLGL::RenderSystem::Load(moduleName, &report);
    if (native)
    {
        return native->GetRendererID();
    }
    return -1;
}



void RenderSystem::UnLoad()
{
    LLGL::RenderSystem::Unload((LLGL::RenderSystemPtr &&)native);
}

FREObject RenderSystem::CreateSwapChain(LLGL::SwapChainDescriptor swapChainDesc)
{
   
    FREObject Air_class;

    swapChain = native->CreateSwapChain(swapChainDesc);

    std::cout << "Swap Chain Format:    " << LLGL::ToString(swapChain->GetColorFormat()) << std::endl;
    std::cout << "Depth/Stencil Format: " << LLGL::ToString(swapChain->GetDepthStencilFormat()) << std::endl;

    FREObject argv[2] = {
        ANEutils->AS_Number((intptr_t)swapChain),
        ANEutils->AS_int(rendererIndex),
    };
    FRENewObject((const uint8_t*)"llgl.SwapChain", 2, argv, &Air_class, NULL);
    return Air_class;
}

FREObject RenderSystem::CreateBuffer(FREObject Air_vertexBufferDesc, FREObject Air_vertices)
{
    
    // Vertex data structure
    struct Vertex
    {
        float   position[2];
        uint8_t color[4];
    };
    // Vertex data (3 vertices for our triangle)
    const float s = 0.5f;
    Vertex vertices[] =
    {
        { {  0,  s }, { 255, 0, 0, 255 } }, // 1st vertex: center-top, red
        { {  s, -s }, { 0, 255, 0, 255 } }, // 2nd vertex: right-bottom, green
        { { -s, -s }, { 0, 0, 255, 255 } }, // 3rd vertex: left-bottom, blue
    };


    float arrayData[18] = {
        0, s, 255, 0, 0, 255,
        s, -s, 0, 255, 0, 255,
        - s, -s,0, 0, 255, 255
    };

    /*
    // Vertex format
    LLGL::VertexFormat vertexFormat;
    // Append 2D float vector for position attribute
    vertexFormat.AppendAttribute({ "position", LLGL::Format::RG32Float });
    // Append 3D unsigned byte vector for color
    vertexFormat.AppendAttribute({ "color",    LLGL::Format::RGBA8UNorm });
    // Update stride in case out vertex structure is not 4-byte aligned
    int intdd = sizeof(Vertex);
    std::cout << "\n intdd==" << intdd << std::endl;
    vertexFormat.SetStride(intdd);
    // Create vertex buffer
    LLGL::BufferDescriptor vertexBufferDesc;
    {
        vertexBufferDesc.size = sizeof(vertices);                 // Size (in bytes) of the vertex buffer
        vertexBufferDesc.bindFlags = LLGL::BindFlags::VertexBuffer;    // Enables the buffer to be bound to a vertex buffer slot
        vertexBufferDesc.vertexAttribs = vertexFormat.attributes;          // Vertex format layout
    }
    */


    auto nativeVertices = ConvertArray(Air_vertices);
    /////////////////////////////////////////
    LLGL::BufferDescriptor nativeDesc;
    Convert(nativeDesc, Air_vertexBufferDesc);
    nativeDesc.size = sizeof(vertices);
    LLGL::Buffer* vertexBuffer = native->CreateBuffer(nativeDesc, &vertices);
    ///////////////////////////////////////////////////////////////////////////////////////////////
    FREObject Air_vertexBuffer;
    FREObject argv[1] = {
        ANEutils->AS_Number((intptr_t)vertexBuffer)
    };
    FRENewObject((const uint8_t*)"llgl.Buffer", 1, argv, &Air_vertexBuffer, NULL);
    FRESetObjectProperty(Air_vertexBuffer, (const uint8_t*)"bindFlags", ANEutils->AS_int((int)vertexBuffer->GetBindFlags()), NULL);
    FRESetObjectProperty(Air_vertexBuffer, (const uint8_t*)"desc",Air_vertexBufferDesc, NULL);
    return Air_vertexBuffer;
}

FREObject RenderSystem::CreateShader(FREObject Air_shaderDesc)
{
    FREObject Air_shader;

    LLGL::ShaderDescriptor shaderDesc;
    Convert(shaderDesc, Air_shaderDesc);
    LLGL::Shader* shader = native->CreateShader(shaderDesc);

    if (auto report = shader->GetReport()) {

        if (report->HasErrors()) {
            std::cerr << "CreateShader error \n" << report->GetText() << std::endl;
        }
    }

    FREObject argv[2] = {
        ANEutils->AS_Number((intptr_t)shader),
        ANEutils->AS_int((int)shader->GetType()),
    };
    FRENewObject((const uint8_t*)"llgl.Shader", 2, argv, &Air_shader, NULL);
    return Air_shader;
}

FREObject RenderSystem::CreatePipelineState(FREObject Air_graphicsPipelineDesc)
{
    FREObject Air_class;
    LLGL::GraphicsPipelineDescriptor pipelineDesc;
    Convert(pipelineDesc, Air_graphicsPipelineDesc);
    pipelineDesc.renderPass = swapChain->GetRenderPass();
    LLGL::PipelineState* pipeline = native->CreatePipelineState(pipelineDesc);
    if (auto report = pipeline->GetReport())
    {
        if (report->HasErrors())
        {
            std::cout << "CreatePipelineState error \n" << report->GetText() << std::endl;
        }
    }



    FREObject argv[1] = {
        ANEutils->AS_Number((intptr_t)pipeline),
    };
    FRENewObject((const uint8_t*)"llgl.PipelineState", 1, argv, &Air_class, NULL);
    return Air_class;
}

FREObject RenderSystem::CreateCommandBuffer(FREObject Air_commandBufferDesc)
{
    FREObject Air_commandBuffer;
    LLGL::CommandBuffer* commands = native->CreateCommandBuffer(LLGL::CommandBufferFlags::ImmediateSubmit);
    FREObject argv[1] = {
        ANEutils->AS_Number((intptr_t)commands),
    };
    FRENewObject((const uint8_t*)"llgl.CommandBuffer", 1, argv, &Air_commandBuffer, NULL);
    return Air_commandBuffer;
}


void RenderSystem::addToNativeWindow(FREObject AirWindow,int x,int y)
{
    // Set window title and show window
    LLGL::Window& window = LLGL::CastTo<LLGL::Window>(swapChain->GetSurface());

    LLGL::NativeHandle myParentWindowHandle;
    window.GetNativeHandle(&myParentWindowHandle, sizeof(myParentWindowHandle));
    hwNative = myParentWindowHandle.window;

    FRENativeWindow nativeWindow;
    FREResult ret = FREAcquireNativeWindowHandle(AirWindow, &nativeWindow);
    if (ret == FRE_OK) {

        SetParent(hwNative, nativeWindow);
        FREReleaseNativeWindowHandle(AirWindow);

        LLGL::Offset2D position = { x,y };
        window.SetPosition(position);
        long style = GetWindowLong(hwNative, GWL_STYLE);
        style &= ~(WS_CAPTION | WS_THICKFRAME | WS_MINIMIZE | WS_MAXIMIZE | WS_SYSMENU);
        SetWindowLongPtr(hwNative, GWL_STYLE, style);
        UINT flags = SWP_NOZORDER;
    }
    window.Show();
}
