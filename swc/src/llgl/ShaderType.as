package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class ShaderType 
	{
		public static const Undefined:int = 0;      //!< Undefined shader type.
		public static const Vertex:int = 1;         //!< Vertex shader type.
		public static const TessControl:int = 2;    //!< Tessellation control shader type (also "Hull Shader").
		public static const TessEvaluation:int = 3; //!< Tessellation evaluation shader type (also "Domain Shader").
		public static const Geometry:int = 4;      //!< Geometry shader type.
		public static const Fragment:int = 5;       //!< Fragment shader type (also "Pixel Shader").
		public static const Compute:int = 6;        //!< Compute shader type.
	}

}