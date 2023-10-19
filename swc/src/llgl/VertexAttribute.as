package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class VertexAttribute 
	{
		
		public function GetSize():int{
			return int(ANELLGL.getInstance().isSupported?ANELLGL.getInstance().context.call("Auxiliary_Function","GetFormatAttribs", format):0);
		}
		
		//! Vertex attribute name (for GLSL) or semantic name (for HLSL).
		public var name:String;
		
		/**
		\brief Vertex attribute format. By default Format::RGBA32Float.
		\remarks Not all hardware formats are allowed for vertex attributes.
		In particular, depth-stencil formats and compressed formats are not allowed.
		To specify a vertex attribute of a matrix type, multiple attributes with ascending semantic indices must be used.
		Here is an example of a 4x4 matrix:
		\code
		myVertexFormat.AppendAttribute({ "myMatrix4x4", 0, LLGL::Format::RGBA32Float });
		myVertexFormat.AppendAttribute({ "myMatrix4x4", 1, LLGL::Format::RGBA32Float });
		myVertexFormat.AppendAttribute({ "myMatrix4x4", 2, LLGL::Format::RGBA32Float });
		myVertexFormat.AppendAttribute({ "myMatrix4x4", 3, LLGL::Format::RGBA32Float });
		\endcode
		Here is an example of a 2x2 matrix:
		\code
		myVertexFormat.AppendAttribute({ "myMatrix2x2", 0, LLGL::Format::RG32Float });
		myVertexFormat.AppendAttribute({ "myMatrix2x2", 1, LLGL::Format::RG32Float });
		\endcode
		*/
		public var format:int          = Format.RGBA32Float;

		/**
		\brief Vertex attribute location (only for OpenGL, Vulkan, Metal) or stream-output number (only for Direct3D).
		\remarks This is only required for OpenGL, Vulkan, and Metal. For Direct3D, this is ignored and instead \c semanticIndex is used.
		\remarks The following example shows GLSL attribute locations from 0 to 4 inclusive:
		\code
		layout(location = 0) in vec4 vertexPosition;   // location 0
		layout(location = 1) in mat4 projectionMatrix; // location 1...4
		\endcode
		\remarks The following example shows Metal attribute locations from 0 to 4 inclusive:
		\code
		struct MyVertexInput
		{
			float4 vertexPosition    [[attribute(0)]];
			float4 projectionMatrix0 [[attribute(1)]];
			float4 projectionMatrix1 [[attribute(2)]];
			float4 projectionMatrix2 [[attribute(3)]];
			float4 projectionMatrix3 [[attribute(4)]];
		};
		\endcode
		*/
		public var location:int        = 0;

		/**
		\brief Semantic index for HLSL.
		\remarks This is only required for Direct3D when a semantic name is used multiple times.
		This happens when a matrix type is distributed over multiple vector attributes.
		\remarks The following example uses semantic names \c POS0, \c MATRIX0, \c MATRIX1, \c MATRIX2, \c MATRIX3:
		\code
		struct MyVertexInput
		{
			float4   vertexPosition   : POS;
			float4x4 projectionMatrix : MATRIX;
		};
		\endcode
		*/
		public var semanticIndex:int   = 0;

		/**
		\brief Specifies the system value type for this vertex attribute or SystemValue::Undefined if this attribute is not a system value. By default SystemValue::Undefined.
		\remarks System value semantics are only used for shader code reflection. Examples of system value semantics are:
		- Vertex ID: \c SV_VertexID (HLSL), \c gl_VertexID (GLSL), \c gl_VertexIndex (SPIR-V), <code>[[vertex_id]]</code> (Metal).
		- Instance ID: \c SV_InstanceID (HLSL), \c gl_InstanceID (GLSL), \c gl_InstanceIndex (SPIR-V), <code>[[instance_id]]</code> (Metal).
		\see Shader::Reflect
		*/
		public var systemValue:int     = SystemValue.Undefined;

		/**
		\brief Vertex buffer binding slot. By default 0.
		\remarks This is used when multiple vertex buffers are used simultaneously.
		This binding slot refers either to the input buffer indices (determined by \c SetVertexBufferArray),
		or stream-output buffer indices (determined by \c BeginStreamOutput).
		\note Only supported with: Direct3D 11, Direct3D 12, Vulkan, Metal.
		\note For OpenGL, the vertex binding slots are automatically generated in ascending order and beginning with zero.
		\see CommandBuffer::SetVertexBufferArray
		\see CommandBuffer::BeginStreamOutput
		*/
		public var slot:int            = 0;

		/**
		\brief Byte offset within each vertex and each buffer for input attributes, or component offset for output attributes. By default 0.
		\remarks For vertex input attributes, this offset specifies the byte aligned offset within each vertex buffer.
		\remarks For stream-output attributes, this offset specifies the first component that is to be written and must be either 0, 1, 2, or 3.
		*/
		public var offset:int          = 0;

		//! Specifies the vertex data stride which describes the byte offset between consecutive vertices.
		public var stride:int          = 0;

		/**
		\brief Instance data divisor (or instance data step rate).
		\remarks If this is 0, this attribute is considered to be stored per vertex.
		If this is greater than 0, this attribute is considered to be stored per every instanceDivisor's instance.
		\note For Vulkan, this must only be 0 or 1.
		*/
		public var instanceDivisor:int = 0;
		
		
		public function VertexAttribute(name:String, format:int,  location:int = 0, instanceDivisor:int =0 )
		{
			this.name = name;
			this.format = format;			
			this.location = location;
			this.instanceDivisor = instanceDivisor;
		}
	}

}