package llgl 
{
	/**
	 * ...
	 * @author Ray.eDoctor
	 */
	public final class CommandQueue 
	{
		private var _CommandQueuePtr:Number;
		
		public function CommandQueue(CommandQueuePtr:Number) 
		{
			_CommandQueuePtr = CommandQueuePtr;
		}
		
		public function get CommandQueuePtr():Number 
		{
			return _CommandQueuePtr;
		}
		
		
		public function Submit(commandBuffer:CommandBuffer):void{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("CommandQueue_Function", _CommandQueuePtr, "Submit", commandBuffer);
			}
		}
	}

}