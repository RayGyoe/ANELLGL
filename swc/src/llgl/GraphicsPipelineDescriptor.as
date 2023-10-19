package llgl
{
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class GraphicsPipelineDescriptor
	{
		
		/**
		   \brief Specifies the vertex shader.
		   \remarks Each graphics pipeline must have at least a vertex shader. Therefore, this must never be null when a graphics PSO is created.
		   With OpenGL, this shader may also have a stream output.
		 */
		public var vertexShader:Shader = null;
		
		/**
		   \brief Specifies the tessellation-control shader (also referred to as "Hull Shader").
		   \remarks If this is used, the counter part must also be specified, i.e. \c tessEvaluationShader.
		   \see tessEvaluationShader
		 */
		public var tessControlShader:Shader = null;
		
		/**
		   \brief Specifies the tessellation-evaluation shader (also referred to as "Domain Shader").
		   \remarks If this is used, the counter part must also be specified, i.e. \c tessControlShader.
		   \see tessControlShader
		 */
		public var tessEvaluationShader:Shader = null;
		
		/**
		   \brief Specifies an optional geometry shader.
		   \remarks This shader may also have a stream output.
		 */
		public var geometryShader:Shader = null;
		
		/**
		   \brief Specifies an optional fragment shader (also referred to as "Pixel Shader").
		   \remarks If no fragment shader is specified, generated fragments are discarded by the output merger
		   and only the stream-output functionality as well as depth writes are used by either the vertex or geometry shader.
		   If a depth buffer is attached to the current render target, omitting the fragment shader can be utilized to render a standard shadow map.
		 */
		public var fragmentShader:Shader = null;
	
	}

}