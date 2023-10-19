package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class PipelineState 
	{
		private var _PipelinePtr:Number;
		
		public function get PipelinePtr():Number 
		{
			return _PipelinePtr;
		}
		
		public function PipelineState(PipelinePtr:Number) 
		{
			_PipelinePtr = PipelinePtr;
		}
		
	}

}