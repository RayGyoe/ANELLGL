package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class Buffer 
	{
		private var _BufferPtr:Number;
		
		public var bindFlags:int;
		public var desc:BufferDescriptor;
		
		public function get BufferPtr():Number 
		{
			return _BufferPtr;
		}
		
		public function Buffer(BufferPtr:Number) 
		{
			_BufferPtr = BufferPtr;
		}
		
	}

}