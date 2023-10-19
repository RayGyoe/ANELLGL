package llgl
{
	/**
	 * ...
	 * @author Ray.eDoctor
	 */
	public class VectorData 
	{
		private var _format:int;
		private var _data:Array;
				
		public function VectorData(format:int,data:Array)
		{
			_format = format;
			_data = data;
		}
		
		public function get data():Array 
		{
			return _data;
		}
		
		public function get format():int 
		{
			return _format;
		}
	}

}