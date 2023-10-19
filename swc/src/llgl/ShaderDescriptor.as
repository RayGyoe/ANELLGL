package llgl
{
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class ShaderDescriptor
	{
		//! Specifies the type of the shader, i.e. if it is either a vertex or fragment shader or the like. By default ShaderType::Undefined.
		public var type:int = ShaderType.Undefined;
		
		/**
		   \brief Pointer to the shader source. This is either a null terminated string or a raw byte buffer (depending on the \c sourceType member).
		   \remarks This must not be null when passed to the RenderSystem::CreateShader function.
		   If this is raw byte buffer rather than a null terminated string, the \c sourceSize member must not be zero!
		   \see sourceSize
		   \see sourceType
		 */
		public var source:String = "";
		
		/**
		   \brief Specifies the size of the shader source (excluding the null terminator).
		   \remarks If this is zero, the 'source' member is expected to point to a null terminated string and the size is automatically determined.
		   For the binary buffer source type (i.e. ShaderSourceType::BinaryBuffer), this must not be zero!
		   \see source
		 */
		public var sourceSize:int = 0;
		
		/**
		   \brief Specifies the type of the shader source. By default ShaderSourceType::CodeFile.
		   \remarks With the filename source types (i.e. ShaderSourceType::CodeFile and ShaderSourceType::BinaryFile),
		   the shader source or binary code will be loaded from file using the standard C++ file streams (i.e. std::ifstream).
		   Only the binary buffer source type (i.e. ShaderSourceType::BinaryBuffer) does not require a null terminator for the \c source pointer.
		   \see ShaderSourceType
		   \see source
		 */
		public var sourceType:int = ShaderSourceType.CodeFile;
			
		/**
		\brief Shader entry point (shader main function). If this is null, the empty string is used. By default null.
		\note Only supported with: HLSL, SPIR-V, Metal.
		*/
		public var  entryPoint:String      = null;

		/**
		\brief Shader target profile. If this is null, the empty string is used. By default null.
		\remarks This is renderer API dependent and is forwarded to the respective shader compiler.
		\remarks Here are a few examples:
		- For HLSL: \c "vs_5_0" specifies vertex shader model 5.0.
		- For Metal: \c "2.1" specifies shader version 2.1.
		- For GLSL: \c "320 es" specifies that the GLSL version must be patched to "#version 300 es".
		\see https://msdn.microsoft.com/en-us/library/windows/desktop/jj215820(v=vs.85).aspx
		*/
		public var      profile:String         = null;

		
		public var flags:uint = 0;

		//! Vertex (or geometry) shader specific attributes.
		public var vertex:VertexShaderAttributes = new VertexShaderAttributes();
		
		
		public function ShaderDescriptor(type:int, source:String,entryPoint:String = null,profile:String = null,flags:int = 0)
		{
			this.type = type;
			this.source = source;
			this.entryPoint = entryPoint;
			this.profile = profile;
			this.flags = flags;
		}
	
	}

}