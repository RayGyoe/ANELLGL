package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class Shader 
	{
		private var _ShaderPtr:Number;
		private var _type:int;
		
		public var bindFlags:int;
		
		public function get ShaderPtr():Number 
		{
			return _ShaderPtr;
		}
		
		public function Shader(ShaderPtr:Number,type:int) 
		{
			_ShaderPtr = ShaderPtr;
			_type = type;
		}
		
		
		public function GetType():int{
			return _type;
		}
		
	}

}