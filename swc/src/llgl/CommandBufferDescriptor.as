package llgl
{
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class CommandBufferDescriptor
	{
		/**
		   \brief Specifies the creation flags for the command buffer. By default 0.
		   \remarks If no flags are specified (i.e. the default value),
		   the command buffer must be encoded again after it has been submitted to the command queue.
		   \see CommandBufferFlags
		 */
		public var flags:uint = 0;
		
		/**
		   \brief Specifies the number of internal native command buffers. By default 2.
		   \remarks This is only a hint to the framework, since not all rendering APIs support command buffers natively.
		   For those that do, however, this member specifies how many native command buffers are to be allocated internally.
		   These native command buffers are then switched everytime encoding begins with the CommandBuffer::Begin function.
		   The benefit of having multiple native command buffers is that it reduces the time the GPU is idle
		   because it waits for a command buffer to be completed before it can be reused.
		   \see CommandBuffer::Begin
		 */
		public var numNativeBuffers:int = 2;
		
		/**
		   \brief Specifies the minimum size (in bytes) for the staging pool (if supported). By default 65536 (or <tt>0xFFFF + 1</tt>).
		   \remarks This is only a hint to the framework, since not all rendering APIs support command buffers natively.
		   For the D3D12 backend for instance, this will specify the initial buffer size for the staging pool, i.e. for buffer updates during command encoding.
		   For command buffers that will make many and large buffer updates, increase this size to fine-tune performance.
		   \see CommandBuffer::UpdateBuffer
		 */
		public var minStagingPoolSize:Number = (0xFFFF + 1);
		
		public function CommandBufferDescriptor(flags:int = 0,numNativeBuffers:int=2)
		{
			this.flags = flags;
			this.numNativeBuffers = numNativeBuffers;
		}
	
	}

}