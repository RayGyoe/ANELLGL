package
{
	//import flash.desktop.NativeApplication;
	import com.vsdevelop.controls.Fps;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.external.ExtensionContext;
	import flash.filesystem.File;
	import flash.sampler.getSize;
	import flash.text.TextField;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import llgl.BindFlags;
	import llgl.Buffer;
	import llgl.BufferDescriptor;
	import llgl.ClearFlags;
	import llgl.CommandBuffer;
	import llgl.CommandBufferDescriptor;
	import llgl.Format;
	import llgl.GraphicsPipelineDescriptor;
	import llgl.RenderSystem;
	import llgl.RenderingCapabilities;
	import llgl.Shader;
	import llgl.ShaderDescriptor;
	import llgl.ShaderType;
	import llgl.SwapChain;
	import llgl.SwapChainDescriptor;
	import llgl.VectorData;
	import llgl.VertexAttribute;
	import llgl.VertexFormat;
	import llgl.PipelineState;
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public class Main extends Sprite
	{
		private var vertexBuffer:Buffer;
		private var commands:CommandBuffer;
		private var pipeline:PipelineState;
		private var swapChian:SwapChain;
		
		public function Main():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			// entry point
			
			stage.nativeWindow.addEventListener(Event.CLOSING, closeApp);
			
			if (ANELLGL.getInstance().isSupported)
			{
				var file:File = ExtensionContext.getExtensionDirectory("com.vsdevelop.air.extension.llgl");
				
				trace(file.nativePath);
				ANELLGL.getInstance().debug = true;
				stage.addEventListener(MouseEvent.CLICK, click);
			}
			addChild(new Fps());
		}
		
		private function initTest():void
		{
			var modules:Vector.<String> = ANELLGL.getInstance().FindModules();
			trace(modules);
			
			if (modules && modules.length)
			{
				var renderSystem:RenderSystem = ANELLGL.getInstance().loadRenderSystem(modules[1]);
				trace(renderSystem);
				if (renderSystem)
				{
					trace("GetName", renderSystem.GetName());
					
					var scd:SwapChainDescriptor = new SwapChainDescriptor();
					scd.depthBits = 1;
					scd.stencilBits = 0;
					scd.samples = 8;
					scd.width = stage.stageWidth;
					scd.height = stage.stageHeight;
					swapChian = renderSystem.CreateSwapChain(scd);
					
					trace("GetRendererID", renderSystem.GetRendererID());
					trace(renderSystem.GetRendererInfo());
					swapChian.SetVsyncInterval(1);
					swapChian.GLWindowToNativeWindow(stage.nativeWindow, 120, 120);//
					//renderSystem->
					
					var renderingCaps:RenderingCapabilities = renderSystem.GetRenderingCaps();
					trace("clippingRange=" + renderingCaps.clippingRange, "renderingCaps.screenOrigin=" + renderingCaps.screenOrigin, renderingCaps.shadingLanguages, renderingCaps.textureFormats);
					
					var s:Number = 0.5;
					var vertices:Array = [[new VectorData(Format.RG32Float, [0, s]), new VectorData(Format.RGBA8UNorm, [255, 0, 0, 255])], // 1st vertex: center-top, red
					[new VectorData(Format.RG32Float, [s, -s]), new VectorData(Format.RGBA8UNorm, [0, 255, 0, 255])], // 2nd vertex: right-bottom, green
					[new VectorData(Format.RG32Float, [-s, -s]), new VectorData(Format.RGBA8UNorm, [0, 0, 255, 255])], // 3rd vertex: left-bottom, blue
					];
					
					// Vertex format
					var vertexFormat:VertexFormat = new VertexFormat();
					// Append 2D float vector for position attribute
					vertexFormat.AppendAttribute(new VertexAttribute("position", Format.RG32Float));
					// Append 3D unsigned byte vector for color
					vertexFormat.AppendAttribute(new VertexAttribute("color", Format.RGBA8UNorm));
					// Update stride in case out vertex structure is not 4-byte aligned
					vertexFormat.SetStride(2 * 6);
					//trace("getSize",getSize([]));
					
					var vertexBufferDesc:BufferDescriptor = new BufferDescriptor();
					vertexBufferDesc.size = 2 * 3 * 6;                 // Size (in bytes) of the vertex buffer
					vertexBufferDesc.bindFlags = BindFlags.VertexBuffer;    // Enables the buffer to be bound to a vertex buffer slot
					vertexBufferDesc.vertexAttribs = vertexFormat.attributes;          // Vertex format layout
					vertexBuffer = renderSystem.CreateBuffer(vertexBufferDesc, vertices);
					
					trace(vertexBuffer);
					
					var vertShaderDesc:ShaderDescriptor = new ShaderDescriptor(ShaderType.Vertex, File.applicationDirectory.nativePath + "\\Example.hlsl", "VS", "vs_4_0");
					var fragShaderDesc:ShaderDescriptor = new ShaderDescriptor(ShaderType.Fragment, File.applicationDirectory.nativePath + "\\Example.hlsl", "PS", "ps_4_0");
					vertShaderDesc.vertex.inputAttribs = vertexFormat.attributes;
					var vertShader:Shader = renderSystem.CreateShader(vertShaderDesc);
					var fragShader:Shader = renderSystem.CreateShader(fragShaderDesc);
					
					trace(vertShader.ShaderPtr, fragShader.ShaderPtr);
					
					var pipelineDesc:GraphicsPipelineDescriptor = new GraphicsPipelineDescriptor();
					pipelineDesc.vertexShader = vertShader;
					pipelineDesc.fragmentShader = fragShader;
					
					pipeline = renderSystem.CreatePipelineState(pipelineDesc);
					
					commands = renderSystem.CreateCommandBuffer(new CommandBufferDescriptor());
					
					trace(commands);
					
					addEventListener(Event.ENTER_FRAME, enterFrame);
					
				}
			}
		}
		
		private function enterFrame(e:Event = null):void
		{
			//ANELLGL.getInstance().context.call("EnterFrame");
			
			commands.Begin();
			// Set vertex buffer
			commands.SetVertexBuffer(vertexBuffer);
			// Set the swap-chain as the initial render target
			commands.BeginRenderPass(swapChian);
			
			commands.Clear(ClearFlags.Color);
			
			// Set graphics pipeline
			commands.SetPipelineState(pipeline);
			// Draw triangle with 3 vertices
			commands.Draw(3, 0);
			
			commands.EndRenderPass();
			commands.End();
			
			swapChian.Present();
		}
		
		private function click(e:MouseEvent):void
		{
			
			initTest();
			
			stage.removeEventListener(MouseEvent.CLICK, click);
			return;
			
			//OpenGL  Direct3D11   Direct3D12
			
			var appRoot:String = File.applicationDirectory.nativePath + "\\";
			
			var debug:TextField = new TextField();
			debug.width = stage.stageWidth;
			debug.text = appRoot;
			debug.y = stage.stageHeight - 100;
			addChild(debug);
			
			if (ANELLGL.getInstance().context.call("RenderSystemLoad", stage.nativeWindow, "Direct3D11", appRoot))
			{
				enterFrame();
				addEventListener(Event.ENTER_FRAME, enterFrame);
			}
		}
		
		private function closeApp(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			ANELLGL.getInstance().dispose();
		}
	
	}

}