package llgl
{
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class CommandBuffer
	{
		private var _CommandBufferPtr:Number;
		
		public function get CommandBufferPtr():Number
		{
			return _CommandBufferPtr;
		}
		
		public function CommandBuffer(CommandBufferPtr:Number)
		{
			_CommandBufferPtr = CommandBufferPtr;
		}
		
		public function Begin():void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "Begin");
			}
		}
		
		public function EndRenderPass():void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "EndRenderPass");
			}
		}
		
		public function End():void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "End");
			}
		}
		
		public function Draw(numVertices:int, firstVertex:int):void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "Draw", numVertices, firstVertex);
			}
		}
		
		public function Clear(flags:int):void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "Clear", flags);
			}
		}
		
		public function SetVertexBuffer(buffer:Buffer):void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "SetVertexBuffer", buffer);
			}
		}
		
		public function BeginRenderPass(swapChian:SwapChain):void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "BeginRenderPass", swapChian);
			}
		}
		
		public function SetPipelineState(pipelineState:PipelineState):void
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandBuffer_Function", _CommandBufferPtr, "SetPipelineState", pipelineState);
			}
		}
	
	}

}