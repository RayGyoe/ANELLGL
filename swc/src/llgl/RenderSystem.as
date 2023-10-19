package llgl
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExtensionContext;
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public class RenderSystem extends EventDispatcher
	{
		private var _ctx:ExtensionContext;
		
		private var _rendererIndex:int;
		private var _rendererID:int;
		private var _rendererInfo:RendererInfo;
		private var _name:String;
		
		public function RenderSystem(ctx:ExtensionContext, rendererIndex:int, rendererID:int)
		{
			_ctx = ctx;
			if (!_ctx)
			{
				throw Error("ANE not init, Initialize from ANELLGL.RenderSystem");
			}
			_rendererIndex = rendererIndex;
			_rendererID = rendererID;
		}
		
		public function GetRendererInfo():RendererInfo
		{
			if (!_rendererInfo)
			{
				_rendererInfo = _ctx.call("RenderSystem_Function", _rendererIndex, "GetRendererInfo") as RendererInfo;
			}
			return _rendererInfo;
		}
		
		public function GetName():String
		{
			if (!_name)_name = _ctx.call("RenderSystem_Function", _rendererIndex, "GetName") as String;
			return _name;
		}
		
		
		public function GetRenderingCaps():RenderingCapabilities
		{
			return _ctx.call("RenderSystem_Function", _rendererIndex, "GetRenderingCaps") as RenderingCapabilities;
		}
		
		
		public function CreateSwapChain(swapChainDescriptor:SwapChainDescriptor):SwapChain
		{
			return _ctx.call("RenderSystem_Function", _rendererIndex, "CreateSwapChain", swapChainDescriptor) as SwapChain;
		}
		
		public function CreateBuffer(desc:BufferDescriptor,vertices:Array):Buffer
		{
			return _ctx.call("RenderSystem_Function", _rendererIndex, "CreateBuffer", desc, vertices) as Buffer;
		}
		
		
		public function CreateShader(desc:ShaderDescriptor):Shader
		{
			return _ctx.call("RenderSystem_Function", _rendererIndex, "CreateShader", desc) as Shader;
		}
		
		public function CreatePipelineState(desc:GraphicsPipelineDescriptor):PipelineState
		{
			return _ctx.call("RenderSystem_Function", _rendererIndex, "CreatePipelineState", desc) as PipelineState;
		}
		
		public function CreateCommandBuffer(desc:CommandBufferDescriptor):CommandBuffer
		{
			return _ctx.call("RenderSystem_Function", _rendererIndex, "CreateCommandBuffer", desc) as CommandBuffer;
		}
		
		
		public function GetRendererID():int
		{
			return _rendererID;
		}
		
		public function GetRendererIndex():int
		{
			return _rendererIndex;
		}
	
	}

}