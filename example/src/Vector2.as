package 
{
	/**
	 * ...
	 * @author Ray.eDoctor
	 */
	public class Vector2 
	{
		private var _format:int;
		private var _data:Array;
		
		public const name:String = "vector2";
		
		public function Vector2(format:int,data:Array)
		{
			_format = format;
			_data = data;
		}
		
		public function get format():int 
		{
			return _format;
		}
	}

}