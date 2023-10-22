
#include "pch.h"

#include "ANELLGL.h"

#include "ANEUtils.h"

#include "RenderSystem.h"

#pragma comment(lib,"LLGL.lib")

// Enable multi-sampling
#define ENABLE_MULTISAMPLING


extern "C" {

	const char* TAG = "ANELLGL";

	//ANEUtils* ANEutils = new ANEUtils();

    bool debug = false;


    std::string FGS = "||";

    std::map<int, RenderSystem*> renderers;
	/*
	³õÊ¼»¯
	*/
	FREObject isSupported(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
	{
		printf("\n%s %s", TAG, "isSupport");
        return ANEutils->AS_Boolean(true);
	}

    FREObject isDeBug(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        debug = ANEutils->getBool(argv[0]);
        printf("\n%s %s  %d", TAG, "isDeBug", debug);
        return NULL;
    }
	

	FREObject FindModules(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
	{
		auto modules = LLGL::RenderSystem::FindModules();

		std::cout << "\n" << modules.size() << std::endl;

        if (debug)printf("\n%s %s=== ", TAG, "FindModules");

        FREObject result = ANEutils->AS_ClassObject("Vector.<String>");

        int il = modules.size();
        FRESetArrayLength(result, il);
        for (int i = 0; i < il; i++)
        {
            FRESetArrayElementAt(result, i, ANEutils->AS_String(modules[i]));
        }
		return result;
	}


    FREObject loadRenderSystem(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        int index = ANEutils->getInt32(argv[0]);
        std::string rendererModule = ANEutils->getString(argv[1]);
        if (debug)printf("\n%s %s===  %d  %s", TAG, "loadRenderSystem",index, rendererModule.c_str());
        LLGL::Report report;
              
        RenderSystem* renderer = new RenderSystem();
        int GetRendererID = renderer->Load(rendererModule);
        if (GetRendererID!=-1)
        {
            renderers[index] = renderer;
            renderer->rendererIndex = index;
            return ANEutils->AS_int(GetRendererID);
        }
        return ANEutils->AS_int(0);
    }
    

    FREObject unloadRenderSystem(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        int index = ANEutils->getInt32(argv[0]);
        if (debug)printf("\n%s %s===  %d", TAG, "unloadRenderSystem", index);
        if (renderers[index]) {
            renderers[index]->UnLoad();
            renderers[index] = NULL;
            return ANEutils->AS_Boolean(true);
        }
        return ANEutils->AS_Boolean(false);
    }

    FREObject RenderSystem_Function(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        int index = ANEutils->getInt32(argv[0]);
        std::string funName = ANEutils->getString(argv[1]);
        if (debug)printf("\n%s %s===  %d", TAG, "RenderSystem_Function", index);
        if (RenderSystem* renderer = renderers[index]) {

            if (funName == "GetName")
            {
                const auto& info = renderer->native->GetName();
                std::cout << "Renderer:             " << info << std::endl;
                return ANEutils->AS_String(info);
            }else if (funName == "GetRendererInfo")
            {
                const auto& info = renderer->native->GetRendererInfo();
                std::cout << "Renderer:             " << info.rendererName << std::endl;
                std::cout << "Device:               " << info.deviceName << std::endl;
                std::cout << "Vendor:               " << info.vendorName << std::endl;
                std::cout << "Shading Language:     " << info.shadingLanguageName << std::endl;
            }else if (funName == "GetCommandQueue")
            {
                LLGL::CommandQueue* queue = renderer->native->GetCommandQueue();
                FREObject Air_class;
                FREObject argv[1] = {
                    ANEutils->AS_Number((intptr_t)queue),
                };
                FRENewObject((const uint8_t*)"llgl.CommandQueue", 1, argv, &Air_class, NULL);
                return Air_class;
            }
            else if (funName == "CreateSwapChain")
            {
                FREObject AirObj = argv[2];

                FREObject width, height, depthBits, stencilBits, samples;
                FREGetObjectProperty(AirObj, (const uint8_t*)"width", &width, NULL);
                FREGetObjectProperty(AirObj, (const uint8_t*)"height", &height, NULL);
                FREGetObjectProperty(AirObj, (const uint8_t*)"depthBits", &depthBits, NULL);
                FREGetObjectProperty(AirObj, (const uint8_t*)"stencilBits", &stencilBits, NULL);
                FREGetObjectProperty(AirObj, (const uint8_t*)"samples", &samples, NULL);

                // Create swap-chain
                LLGL::SwapChainDescriptor swapChainDesc;
                {
                    swapChainDesc.resolution = { (uint32_t)ANEutils->getInt32(width),  (uint32_t)ANEutils->getInt32(height) };
                    swapChainDesc.depthBits = ANEutils->getInt32(depthBits); // We don't need a depth buffer for this example
                    swapChainDesc.stencilBits = ANEutils->getInt32(stencilBits); // We don't need a stencil buffer for this example
                    swapChainDesc.samples = ANEutils->getInt32(samples); // check if LLGL adapts sample count that is too high
                }
                return renderer->CreateSwapChain(swapChainDesc);
            }
            else if (funName  == "CreateBuffer") {
               return renderer->CreateBuffer(argv[2], argv[3]);
            }
            else if (funName == "CreateShader") {
                return renderer->CreateShader(argv[2]);
            }
            else if (funName == "CreatePipelineState") {
                return renderer->CreatePipelineState(argv[2]);
            }
            else if (funName == "CreateCommandBuffer") {
                return renderer->CreateCommandBuffer(argv[2]);
            }
            else if (funName == "GetRenderingCaps") {

                LLGL::RenderingCapabilities renderingCapabilities  = renderer->native->GetRenderingCaps();
                /////------------------------
                FREObject AS_renderingCapabilities = ANEutils->AS_ClassObject("llgl.RenderingCapabilities");
                FRESetObjectProperty(AS_renderingCapabilities, (const uint8_t*)"screenOrigin", ANEutils->AS_int((int)renderingCapabilities.screenOrigin), NULL);
                FRESetObjectProperty(AS_renderingCapabilities, (const uint8_t*)"clippingRange", ANEutils->AS_int((int)renderingCapabilities.clippingRange), NULL);
                /// <summary>
                /// 
                /// </summary>
                int i, il;
                il = renderingCapabilities.shadingLanguages.size();
                FREObject shadingLanguages = ANEutils->AS_ClassObject("Vector.<int>");
                FRESetArrayLength(shadingLanguages, il);
                for (i = 0; i < il; i++)
                {
                    FRESetArrayElementAt(shadingLanguages, i, ANEutils->AS_int((int)renderingCapabilities.shadingLanguages[i]));
                }
                FRESetObjectProperty(AS_renderingCapabilities, (const uint8_t*)"shadingLanguages", shadingLanguages, NULL);

                il = renderingCapabilities.textureFormats.size();
                FREObject textureFormats = ANEutils->AS_ClassObject("Vector.<int>");
                FRESetArrayLength(textureFormats, il);
                for (i = 0; i < il; i++)
                {
                    FRESetArrayElementAt(textureFormats, i, ANEutils->AS_int((int)renderingCapabilities.textureFormats[i]));
                }
                FRESetObjectProperty(AS_renderingCapabilities, (const uint8_t*)"textureFormats", textureFormats, NULL);
                /// <summary>
                /// 
                /// </summary>
                FREObject limits = ANEutils->AS_ClassObject("llgl.RenderingLimits");                
                FRESetObjectProperty(limits, (const uint8_t*)"maxTextureArrayLayers", ANEutils->AS_int(renderingCapabilities.limits.maxTextureArrayLayers), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxColorAttachments", ANEutils->AS_int(renderingCapabilities.limits.maxColorAttachments), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxPatchVertices", ANEutils->AS_int(renderingCapabilities.limits.maxPatchVertices), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"max1DTextureSize", ANEutils->AS_int(renderingCapabilities.limits.max1DTextureSize), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"max2DTextureSize", ANEutils->AS_int(renderingCapabilities.limits.max2DTextureSize), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"max3DTextureSize", ANEutils->AS_int(renderingCapabilities.limits.max3DTextureSize), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxCubeTextureSize", ANEutils->AS_int(renderingCapabilities.limits.maxCubeTextureSize), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxAnisotropy", ANEutils->AS_int(renderingCapabilities.limits.maxAnisotropy), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxViewports", ANEutils->AS_int(renderingCapabilities.limits.maxViewports), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxBufferSize", ANEutils->AS_uint(renderingCapabilities.limits.maxBufferSize), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxConstantBufferSize", ANEutils->AS_uint(renderingCapabilities.limits.maxConstantBufferSize), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxStreamOutputs", ANEutils->AS_uint(renderingCapabilities.limits.maxStreamOutputs), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxTessFactor", ANEutils->AS_int(renderingCapabilities.limits.maxTessFactor), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"minConstantBufferAlignment", ANEutils->AS_uint(renderingCapabilities.limits.minConstantBufferAlignment), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"minStorageBufferAlignment", ANEutils->AS_uint(renderingCapabilities.limits.minStorageBufferAlignment), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxColorBufferSamples", ANEutils->AS_int(renderingCapabilities.limits.maxColorBufferSamples), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxDepthBufferSamples", ANEutils->AS_int(renderingCapabilities.limits.maxDepthBufferSamples), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxStencilBufferSamples", ANEutils->AS_int(renderingCapabilities.limits.maxStencilBufferSamples), NULL);
                FRESetObjectProperty(limits, (const uint8_t*)"maxNoAttachmentSamples", ANEutils->AS_int(renderingCapabilities.limits.maxNoAttachmentSamples), NULL);
                FRESetObjectProperty(AS_renderingCapabilities, (const uint8_t*)"limits", limits, NULL);

                /// <summary>
                /// //
                /// </summary>
                FREObject features = ANEutils->AS_ClassObject("llgl.RenderingFeatures");
                FRESetObjectProperty(features, (const uint8_t*)"hasRenderTargets", ANEutils->AS_Boolean(renderingCapabilities.features.hasRenderTargets), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"has3DTextures", ANEutils->AS_Boolean(renderingCapabilities.features.has3DTextures), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasCubeTextures", ANEutils->AS_Boolean(renderingCapabilities.features.hasCubeTextures), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasArrayTextures", ANEutils->AS_Boolean(renderingCapabilities.features.hasArrayTextures), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasCubeArrayTextures", ANEutils->AS_Boolean(renderingCapabilities.features.hasCubeArrayTextures), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasMultiSampleTextures", ANEutils->AS_Boolean(renderingCapabilities.features.hasMultiSampleTextures), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasMultiSampleArrayTextures", ANEutils->AS_Boolean(renderingCapabilities.features.hasMultiSampleArrayTextures), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasTextureViews", ANEutils->AS_Boolean(renderingCapabilities.features.hasTextureViews), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasTextureViewSwizzle", ANEutils->AS_Boolean(renderingCapabilities.features.hasTextureViewSwizzle), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasBufferViews", ANEutils->AS_Boolean(renderingCapabilities.features.hasBufferViews), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasSamplers", ANEutils->AS_Boolean(renderingCapabilities.features.hasSamplers), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasConstantBuffers", ANEutils->AS_Boolean(renderingCapabilities.features.hasConstantBuffers), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasStorageBuffers", ANEutils->AS_Boolean(renderingCapabilities.features.hasStorageBuffers), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasUniforms", ANEutils->AS_Boolean(renderingCapabilities.features.hasUniforms), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasGeometryShaders", ANEutils->AS_Boolean(renderingCapabilities.features.hasGeometryShaders), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasTessellationShaders", ANEutils->AS_Boolean(renderingCapabilities.features.hasTessellationShaders), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasTessellatorStage", ANEutils->AS_Boolean(renderingCapabilities.features.hasTessellatorStage), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasComputeShaders", ANEutils->AS_Boolean(renderingCapabilities.features.hasComputeShaders), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasInstancing", ANEutils->AS_Boolean(renderingCapabilities.features.hasInstancing), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasOffsetInstancing", ANEutils->AS_Boolean(renderingCapabilities.features.hasOffsetInstancing), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasIndirectDrawing", ANEutils->AS_Boolean(renderingCapabilities.features.hasIndirectDrawing), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasViewportArrays", ANEutils->AS_Boolean(renderingCapabilities.features.hasViewportArrays), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasConservativeRasterization", ANEutils->AS_Boolean(renderingCapabilities.features.hasConservativeRasterization), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasStreamOutputs", ANEutils->AS_Boolean(renderingCapabilities.features.hasStreamOutputs), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasLogicOp", ANEutils->AS_Boolean(renderingCapabilities.features.hasLogicOp), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasPipelineStatistics", ANEutils->AS_Boolean(renderingCapabilities.features.hasPipelineStatistics), NULL);
                FRESetObjectProperty(features, (const uint8_t*)"hasRenderCondition", ANEutils->AS_Boolean(renderingCapabilities.features.hasRenderCondition), NULL);
                FRESetObjectProperty(AS_renderingCapabilities, (const uint8_t*)"features", features,NULL);

                return AS_renderingCapabilities;
            }

        }
        return NULL;
    }

    FREObject SwapChain_Function(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        int index = ANEutils->getInt32(argv[0]);
        std::string funName = ANEutils->getString(argv[1]);
        if (debug)printf("\n%s %s===  %d", TAG, "SwapChain_Function", index);
        if (RenderSystem* renderer = renderers[index]) {

            if (funName == "SetVsyncInterval")
            {
                ANEutils->AS_Boolean(renderer->swapChain->SetVsyncInterval(ANEutils->getInt32(argv[2])));
            }
            else if (funName == "GLWindowToNativeWindow")
            {
                renderer->addToNativeWindow(argv[2],ANEutils->getInt32(argv[3]), ANEutils->getInt32(argv[4]));
            }
            else if (funName == "Present") {
                renderer->swapChain->Present();
            }
        }
        return NULL;
    }

    


    FREObject CommandQueue_Function(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        double _CommandQueuePtr = ANEutils->getDouble(argv[0]);
        std::string funName = ANEutils->getString(argv[1]);

        LLGL::CommandQueue* queue = reinterpret_cast<LLGL::CommandQueue*>((uintptr_t)_CommandQueuePtr);

        if (funName == "Submit")
        {
            LLGL::CommandBuffer* commands = reinterpret_cast<LLGL::CommandBuffer*>((uintptr_t)ANEutils->getDouble(argv[2], "CommandBufferPtr"));
            queue->Submit(*commands);
        }
        return NULL;
    }

    FREObject CommandBuffer_Function(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        double _CommandBufferPtr = ANEutils->getDouble(argv[0]);
        std::string funName = ANEutils->getString(argv[1]);
        //if (debug)printf("\n%s %s===  %s", TAG, "CommandBuffer_Function", funName.c_str());

        LLGL::CommandBuffer* commands =  reinterpret_cast<LLGL::CommandBuffer*>((uintptr_t)_CommandBufferPtr);

        if (funName == "Begin")
        {
            commands->Begin();
        }
        else if (funName == "EndRenderPass")
        {
            commands->EndRenderPass();
        }
        else if (funName == "End") {
            commands->End();
        }
        else if (funName == "Draw") {
            commands->Draw((uint32_t)ANEutils->getInt32(argv[2]), (uint32_t)ANEutils->getInt32(argv[3]));
        }
        else if (funName == "Clear") {
            commands->Clear((uint32_t)ANEutils->getInt32(argv[2]));
        }
        else if (funName == "SetVertexBuffer") {
            LLGL::Buffer* buffer = reinterpret_cast<LLGL::Buffer*>((uintptr_t)ANEutils->getDouble(argv[2], "BufferPtr"));

            std::cout << "\n buffer=" << buffer->GetDesc().size << std::endl;
            commands->SetVertexBuffer(*buffer);
        }
        else if (funName == "BeginRenderPass") {
            LLGL::SwapChain* swapChain = reinterpret_cast<LLGL::SwapChain*>((uintptr_t)ANEutils->getDouble(argv[2], "SwapChainPtr"));
            std::cout << "\n swapChain=" << swapChain->GetResolution().width << std::endl;
            commands->BeginRenderPass(*swapChain);
        }
        else if (funName == "SetPipelineState") {
            LLGL::PipelineState* pipeline = reinterpret_cast<LLGL::PipelineState*>((uintptr_t)ANEutils->getDouble(argv[2], "PipelinePtr"));
            std::cout << "\n pipeline=" << pipeline->GetInterfaceID() << std::endl;

            commands->SetPipelineState(*pipeline);
        }
        else if (funName == "SetViewport") {
            LLGL::Viewport viewport;
            Convert(viewport, argv[2]);
            commands->SetViewport(viewport);
        }
        
        return NULL;
    }
    



    FREObject Auxiliary_Function(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {
        std::string funName = ANEutils->getString(argv[0]);
        if (debug)printf("\n%s %s===  %s", TAG, "Auxiliary_Function", funName.c_str());

        if (funName == "GetFormatAttribs")
        {
            const auto& formatAttribs = LLGL::GetFormatAttribs(static_cast<LLGL::Format>(ANEutils->getInt32(argv[1])));
            if ((formatAttribs.flags & LLGL::FormatFlags::SupportsVertex) != 0)
                return ANEutils->AS_int(formatAttribs.bitSize / 8);
            else
                return ANEutils->AS_int(0);
        }


        return NULL;
    }
    /////////////////////////////////////////////

    LLGL::Report report;
    LLGL::RenderSystemPtr renderer;
    ////
    LLGL::SwapChain* swapChain;
    LLGL::Buffer* vertexBuffer;
    LLGL::CommandBuffer* commands;
    // Create graphics pipeline 
    LLGL::PipelineState* pipeline = nullptr;
	/*
	* Load DLL
	*/
	FREObject RenderSystemLoad(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
	{
        
		std::string rendererModule = ANEutils->getString(argv[1]);

        std::string strRoot = ANEutils->getString(argv[2]);
		try
		{
			std::cout << "\n"  << "RenderSystemLoad:" << rendererModule << std::endl;


            LLGL::RenderingProfiler myProfiler;
            LLGL::RenderingDebugger myDebugger;

            // Load the "Direct3D11" render system module
			renderer = LLGL::RenderSystem::Load(rendererModule,&report);

            std::cout << "report:" << report << std::endl;
            if (!renderer) {

                return NULL;
            }
            std::cout << "GetRendererID:" << renderer->GetRendererID() << " GetName:" << renderer->GetName() << std::endl;
            
			// Create swap-chain
			LLGL::SwapChainDescriptor swapChainDesc;
			{
				swapChainDesc.resolution = { 800, 600 };
				swapChainDesc.depthBits = 1; // We don't need a depth buffer for this example
				swapChainDesc.stencilBits = 0; // We don't need a stencil buffer for this example
				#ifdef ENABLE_MULTISAMPLING
					swapChainDesc.samples = 8; // check if LLGL adapts sample count that is too high
				#endif
			}
			swapChain = renderer->CreateSwapChain(swapChainDesc);

			// Print renderer information
			const auto& info = renderer->GetRendererInfo();

			std::cout << "Renderer:             " << info.rendererName << std::endl;
			std::cout << "Device:               " << info.deviceName << std::endl;
			std::cout << "Vendor:               " << info.vendorName << std::endl;
			std::cout << "Shading Language:     " << info.shadingLanguageName << std::endl;
			std::cout << "Swap Chain Format:    " << LLGL::ToString(swapChain->GetColorFormat()) << std::endl;
			std::cout << "Depth/Stencil Format: " << LLGL::ToString(swapChain->GetDepthStencilFormat()) << std::endl;




			// Enable V-sync
			swapChain->SetVsyncInterval(1);



			// Set window title and show window
            LLGL::Window& window = LLGL::CastTo<LLGL::Window>(swapChain->GetSurface());
			//window.SetTitle(L"LLGL Example: Hello Triangle");
			//window.Show();
            LLGL::NativeHandle myParentWindowHandle;
            window.GetNativeHandle(&myParentWindowHandle, sizeof(myParentWindowHandle));
            HWND hwNative = myParentWindowHandle.window;


            FRENativeWindow nativeWindow;
            FREObject AirWindow = argv[0];
            FREResult ret = FREAcquireNativeWindowHandle(AirWindow, &nativeWindow);
            if (ret == FRE_OK) {
               
                SetParent(hwNative, nativeWindow);
                FREReleaseNativeWindowHandle(AirWindow);

                LLGL::Offset2D position = { 0,0 };
                window.SetPosition(position);


                long style = GetWindowLong(hwNative, GWL_STYLE);
                style &= ~(WS_CAPTION | WS_THICKFRAME | WS_MINIMIZE | WS_MAXIMIZE | WS_SYSMENU);
                SetWindowLongPtr(hwNative, GWL_STYLE, style);

                UINT flags = SWP_NOZORDER;
                //SetWindowPos(hwNative, 0, 0, swapChainDesc.resolution.width, swapChainDesc.resolution.height, flags);
            }
            window.Show();


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

            // Vertex format
            LLGL::VertexFormat vertexFormat;

            // Append 2D float vector for position attribute
            vertexFormat.AppendAttribute({ "position", LLGL::Format::RG32Float });

            // Append 3D unsigned byte vector for color
            vertexFormat.AppendAttribute({ "color",    LLGL::Format::RGBA8UNorm });

            // Update stride in case out vertex structure is not 4-byte aligned
            vertexFormat.SetStride(sizeof(Vertex));

            // Create vertex buffer
            LLGL::BufferDescriptor vertexBufferDesc;
            {
                vertexBufferDesc.size = sizeof(vertices);                 // Size (in bytes) of the vertex buffer
                vertexBufferDesc.bindFlags = LLGL::BindFlags::VertexBuffer;    // Enables the buffer to be bound to a vertex buffer slot
                vertexBufferDesc.vertexAttribs = vertexFormat.attributes;          // Vertex format layout
            }
            vertexBuffer = renderer->CreateBuffer(vertexBufferDesc, vertices);

            // Create shaders
            LLGL::Shader* vertShader = nullptr;
            LLGL::Shader* fragShader = nullptr;

            const auto& languages = renderer->GetRenderingCaps().shadingLanguages;

            LLGL::ShaderDescriptor vertShaderDesc, fragShaderDesc;

            if (std::find(languages.begin(), languages.end(), LLGL::ShadingLanguage::GLSL) != languages.end())
            {
                if (std::find(languages.begin(), languages.end(), LLGL::ShadingLanguage::GLSL_140) != languages.end())
                {
#ifdef __APPLE__
                    vertShaderDesc = { LLGL::ShaderType::Vertex,   "Example.140core.vert" };
                    fragShaderDesc = { LLGL::ShaderType::Fragment, "Example.140core.frag" };
#else
                    vertShaderDesc = { LLGL::ShaderType::Vertex,   "Example.vert" };
                    fragShaderDesc = { LLGL::ShaderType::Fragment, "Example.frag" };
#endif
                }
                else
                {
                    vertShaderDesc = { LLGL::ShaderType::Vertex,   "Example.120.vert" };
                    fragShaderDesc = { LLGL::ShaderType::Fragment, "Example.120.frag" };
                }
            }
            else if (std::find(languages.begin(), languages.end(), LLGL::ShadingLanguage::SPIRV) != languages.end())
            {
                vertShaderDesc = LLGL::ShaderDescFromFile(LLGL::ShaderType::Vertex, "Example.450core.vert.spv");
                fragShaderDesc = LLGL::ShaderDescFromFile(LLGL::ShaderType::Fragment, "Example.450core.frag.spv");
            }
            else if (std::find(languages.begin(), languages.end(), LLGL::ShadingLanguage::HLSL) != languages.end())
            {
                vertShaderDesc = { LLGL::ShaderType::Vertex,   "Example.hlsl", "VS", "vs_4_0" };
                fragShaderDesc = { LLGL::ShaderType::Fragment, "Example.hlsl", "PS", "ps_4_0" };
            }
            else if (std::find(languages.begin(), languages.end(), LLGL::ShadingLanguage::Metal) != languages.end())
            {
                vertShaderDesc = { LLGL::ShaderType::Vertex,   "Example.metal", "VS", "1.1" };
                fragShaderDesc = { LLGL::ShaderType::Fragment, "Example.metal", "PS", "1.1" };
            }


            std::string fullUrl_vs = strRoot + vertShaderDesc.source;
            std::string fullUrl_fs = strRoot + fragShaderDesc.source;
            vertShaderDesc.source = (const char*)fullUrl_vs.c_str();
            fragShaderDesc.source = (const char*)fullUrl_fs.c_str();

            // Specify vertex attributes for vertex shader
            vertShaderDesc.vertex.inputAttribs = vertexFormat.attributes;

            vertShader = renderer->CreateShader(vertShaderDesc);
            fragShader = renderer->CreateShader(fragShaderDesc);
            

            for (auto shader : { vertShader, fragShader })
            {
                if (auto report = shader->GetReport())
                    std::cerr << report->GetText() << std::endl;
            }


                LLGL::GraphicsPipelineDescriptor pipelineDesc;
                {
                    pipelineDesc.vertexShader = vertShader;
                    pipelineDesc.fragmentShader = fragShader;
                    pipelineDesc.renderPass = swapChain->GetRenderPass();
#ifdef ENABLE_MULTISAMPLING
                    pipelineDesc.rasterizer.multiSampleEnabled = (swapChainDesc.samples > 1);
#endif
                }

                pipeline = renderer->CreatePipelineState(pipelineDesc);

                // Link shader program and check for errors
                if (auto report = pipeline->GetReport())
                {
                    if (report->HasErrors())
                    {
                        std::cout << "error \n" << report->GetText() << std::endl;
                    }
                }

            // Create command buffer to submit subsequent graphics commands to the GPU
            commands = renderer->CreateCommandBuffer(LLGL::CommandBufferFlags::ImmediateSubmit);
        }
        catch (const std::exception& e)
        {
            std::cerr << e.what() << std::endl;
        }
		

		FREObject result;
		auto status = FRENewObjectFromBool(true, &result);
		return result;
	}


    FREObject EnterFrame(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[])
    {

        // Enter main loop
        //std::cout << "\n" << "EnterFrame" << std::endl;


        if (commands == NULL) return NULL;
            // Begin recording commands

        //LLGL::Surface::ProcessEvents();

        commands->Begin();
        {
            // Set viewport and scissor rectangle

            LLGL::Viewport viewport =  swapChain->GetResolution();

            std::cout << "\n  x£º" << viewport.x << "   y£º" << viewport.y << " width:" << viewport.width << "  height:" << viewport.height << std::endl;

            commands->SetViewport(viewport);

            // Set vertex buffer
            commands->SetVertexBuffer(*vertexBuffer);

            // Set the swap-chain as the initial render target
            commands->BeginRenderPass(*swapChain);
            {
                // Clear color buffer
                commands->Clear(LLGL::ClearFlags::Color);

                // Set graphics pipeline
                commands->SetPipelineState(*pipeline);

                // Draw triangle with 3 vertices
                commands->Draw(3, 0);
            }
            commands->EndRenderPass();
        }
        commands->End();

        // Present the result on the screen
        swapChain->Present();

        return  NULL;
    }

	///
	// Flash Native Extensions stuff	
	void ANELLGLContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {

		static FRENamedFunction extensionFunctions[] =
		{
			{ (const uint8_t*)"isSupported",					NULL, &isSupported },
            { (const uint8_t*)"debug",					NULL, &isDeBug },

            { (const uint8_t*)"FindModules",				NULL, &FindModules },
            { (const uint8_t*)"loadRenderSystem",				NULL, &loadRenderSystem },
            { (const uint8_t*)"unloadRenderSystem",				NULL, &unloadRenderSystem },
            { (const uint8_t*)"RenderSystem_Function",				NULL, &RenderSystem_Function },
            { (const uint8_t*)"SwapChain_Function",				NULL, &SwapChain_Function },

            { (const uint8_t*)"CommandBuffer_Function",				NULL, &CommandBuffer_Function },
            { (const uint8_t*)"CommandQueue_Function",				NULL, &CommandQueue_Function },
            
            //¸¨Öúº¯Êý---
            { (const uint8_t*)"Auxiliary_Function",				NULL, &Auxiliary_Function },
            


			{ (const uint8_t*)"RenderSystemLoad",				NULL, &RenderSystemLoad },

            { (const uint8_t*)"EnterFrame",				NULL, &EnterFrame },
            
		};

		*numFunctionsToSet = sizeof(extensionFunctions) / sizeof(FRENamedFunction);
		*functionsToSet = extensionFunctions;
	}

	void ANELLGLContextFinalizer(void* extData)
	{
		printf("\n%s,%s", TAG, "ANELLGLContextFinalizer£ºrelease()");

		if (renderer != nullptr) {
			LLGL::RenderSystem::Unload(std::forward<LLGL::RenderSystemPtr>(renderer));
		}

	}


	void ANELLGLExtInitializer(void** extData, FREContextInitializer* ctxInitializer, FREContextFinalizer* ctxFinalizer)
	{
		*ctxInitializer = &ANELLGLContextInitializer;
		*ctxFinalizer = &ANELLGLContextFinalizer;
	}

	void ANELLGLExtFinalizer(void* extData)
	{
		printf("\n%s,%s", TAG, "ANELLGLExtFinalizer£ºrelease()");
	}

}