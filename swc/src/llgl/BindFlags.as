package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public  final class BindFlags 
	{
		
		public static const None:int                    = 0;
		/**
		\brief The resource can be used to bind a stream of vertices.
		\remarks This can only be used for Buffer resources.
		\see CommandBuffer::SetVertexBuffer
		*/
		public static const VertexBuffer:int            = 1 << 0;

		/**
		\brief The resource can be used to bind a stream of indices.
		\remarks This can only be used for Buffer resources.
		\see CommandBuffer::SetIndexBuffer
		*/
		public static const IndexBuffer:int             = 1 << 1;

		/**
		\brief The resource can be used to bind a set of constants.
		\remarks This can only be used for Buffer resources and must \e not be combined with any other bind flags except for CopySrc and CopyDst.
		*/
		public static const ConstantBuffer:int          = 1 << 2;

		/**
		\brief The resource can be used to bind an output stream buffer (also referred to as "transform feedback").
		\remarks This can only be used for Buffer resources.
		\see CommandBuffer::BeginStreamOutput
		*/
		public static const StreamOutputBuffer:int      = 1 << 3;

		/**
		\brief Hint to the renderer that the resource will hold the arguments for indirect commands.
		\remarks This can only be used for Buffer resources.
		\see CommandBuffer::DrawIndirect
		\see CommandBuffer::DrawIndexedIndirect
		\see CommandBuffer::DispatchIndirect
		*/
		public static const IndirectBuffer:int          = (1 << 4);

		/**
		\brief The resource can be used to bind a buffer or texture for read access.
		\remarks This can be used for Buffer resources (e.g. \c samplerBuffer in GLSL, or \c StructuredBuffer in HLSL) and
		Texture resources (e.g. \c sampler2D in GLSL, or \c Texture2D in HLSL).
		*/
		public static const Sampled:int                 = (1 << 5);

		/**
		\brief The resource can be used to bind a buffer or texture for unordered read/write access.
		\remarks This can be used for Buffer resources (e.g. \c buffer in GLSL, or \c RWStructuredBuffer in HLSL) and
		Texture resources (e.g. \c image2D in GLSL, or \c RWTexture2D in HLSL).
		*/
		public static const Storage:int                 = (1 << 6);

		/**
		\brief Texture can be used as render target color attachment.
		\remarks This can only be used for Texture resources.
		\note This cannot be used together with the BindFlags::DepthStencilAttachment flag.
		\see AttachmentDescriptor::texture
		\see AttachmentDescriptor::format
		*/
		public static const ColorAttachment:int         = (1 << 7);

		/**
		\brief Texture can be used as render target depth-stencil attachment.
		\remarks This can only be used for Texture resources.
		\note This cannot be used together with the BindFlags::ColorAttachment flag.
		\see AttachmentDescriptor::texture
		\see AttachmentDescriptor::format
		*/
		public static const DepthStencilAttachment:int  = (1 << 8);

		/**
		\brief Specifies a resource as a combination of a Texture and Sampler (e.g. \c sampler2D in GLSL).
		\remarks This is only used for shader reflection and ignored by resource creation.
		\note Only supported with: OpenGL, Vulkan.
		\see ShaderResourceReflection::binding
		*/
		public static const CombinedSampler:int         = (1 << 9);

		/**
		\brief Specifies a resource can be used as source for a copy command.
		\see CommandBuffer::CopyBuffer
		\see CommandBuffer::CopyBufferFromTexture
		\see CommandBuffer::CopyTexture
		\see CommandBuffer::CopyTextureFromBuffer
		*/
		public static const CopySrc:int                 = (1 << 10);

		/**
		\brief Specifies a resource can be used as destination for a copy or fill command.
		\see CommandBuffer::CopyBuffer
		\see CommandBuffer::CopyBufferFromTexture
		\see CommandBuffer::CopyTexture
		\see CommandBuffer::CopyTextureFromBuffer
		\see CommandBuffer::FillBuffer
		*/
		public static const CopyDst:int                 = (1 << 11);
		
	}

}