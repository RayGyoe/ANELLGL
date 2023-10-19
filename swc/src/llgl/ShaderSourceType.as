package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class ShaderSourceType 
	{
		
		public static const CodeString:int = 0;     //!< Refers to <code>sourceSize+1</code> bytes, describing shader high-level code (including null terminator).
		public static const CodeFile:int = 1;       //!< Refers to <code>sourceSize+1</code> bytes, describing the filename of the shader high-level code (including null terminator).
		public static const BinaryBuffer:int = 2;   //!< Refers to <code>sourceSize</code> bytes, describing shader binary code.
		public static const BinaryFile:int = 3;     //!< Refers to <code>sourceSize+1</code> bytes, describing the filename of the shader binary code (including null terminator).

	}

}