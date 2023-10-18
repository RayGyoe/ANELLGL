package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class RenderingLimits
	{
		
		/**
		\brief Specifies the range for rasterizer line widths. By default [1, 1].
		\note Only supported with: OpenGL, Vulkan.
		\see RasterizerDescriptor::lineWidth
		*/
		//public var lineWidthRange                   = { 1.0f, 1.0f };

		/**
		\brief Specifies the maximum number of texture array layers (for 1D-, 2D-, and cube textures).
		\see TextureDescriptor::arrayLayers
		*/
		public var maxTextureArrayLayers:int               = 0;

		/**
		\brief Specifies the maximum number of color attachments for each render target.
		\remarks This value <b>must not</b> be greater than 8.
		\see RenderTargetDescriptor::attachments
		\see RenderPassDescriptor::colorAttachments
		\see BlendDescriptor::targets
		*/
		public var maxColorAttachments:int                 = 0;

		/**
		\brief Specifies the maximum number of patch control points.
		\see PrimitiveTopology::Patches1
		\see PrimitiveTopology::Patches32
		*/
		public var maxPatchVertices:int                    = 0;

		/**
		\brief Specifies the maximum size of each 1D texture.
		\see TextureDescriptor::extent
		*/
		public var max1DTextureSize:int                    = 0;

		/**
		\brief Specifies the maximum size of each 2D texture (for width and height).
		\see TextureDescriptor::extent
		*/
		public var max2DTextureSize:int                    = 0;

		/**
		\brief Specifies the maximum size of each 3D texture (for width, height, and depth).
		\see TextureDescriptor::extent
		*/
		public var max3DTextureSize:int                    = 0;

		/**
		\brief Specifies the maximum size of each cube texture (for width and height).
		\see TextureDescriptor::extent
		*/
		public var maxCubeTextureSize:int                  = 0;

		/**
		\brief Specifies the maximum anisotropy texture filter.
		\see SamplerDescriptor::maxAnisotropy
		*/
		public var maxAnisotropy:int                       = 0;

		/**
		\brief Specifies the maximum number of work groups in a compute shader.
		\see CommandBuffer::Dispatch
		*/
		//public var maxComputeShaderWorkGroups[3]       = { 0, 0, 0 };

		//! Specifies the maximum work group size in a compute shader.
		//public var maxComputeShaderWorkGroupSize[3]    = { 0, 0, 0 };

		/**
		\brief Specifies the maximum number of viewports and scissor rectangles the render system supports. Upper limit is specified by \c LLGL_MAX_NUM_VIEWPORTS_AND_SCISSORS.
		\see CommandBuffer::SetViewports
		\see CommandBuffer::SetScissors
		\see GraphicsPipelineDescriptor::viewports
		\see GraphicsPipelineDescriptor::scissors
		\see RenderingFeatures::hasViewportArrays
		*/
		public var maxViewports:int                        = 0;

		/**
		\brief Specifies the maximum width and height of each viewport and scissor rectangle.
		\see Viewport::width
		\see Viewport::height
		\see Scissor::width
		\see Scissor::height
		*/
		//public var maxViewportSize[2]                  = { 0, 0 };

		/**
		\brief Specifies the maximum size (in bytes) that is supported for hardware buffers (vertex, index, storage buffers).
		\remarks Constant buffers are a special case for which \c maxConstantBufferSize can be used.
		\see BufferDescriptor::size
		\see maxConstantBufferSize
		*/
		public var maxBufferSize:uint                       = 0;

		/**
		\brief Specifies the maximum size (in bytes) that is supported for hardware constant buffers.
		\remarks This is typically a lot smaller than the maximum size for other types of buffers.
		\see BufferDescriptor::size
		*/
		public var maxConstantBufferSize:uint               = 0;

		/**
		\brief Specifies the maximum number of simultaneous stream-output buffers.
		\remarks This must not be larger than \c LLGL_MAX_NUM_SO_BUFFERS which is 4.
		\see CommandBuffer::BeginStreamOutput
		\see RenderingFeatures::hasStreamOutputs
		*/
		public var maxStreamOutputs:uint                    = 0;

		/**
		\brief Specifies the maximum tessellation factor.
		\remarks Metal for example supports 64 on macOS and 16 on iOS.
		\see TessellationDescriptor::maxTessFactor
		*/
		public var maxTessFactor:int                       = 0;

		/**
		\brief Specifies the minimum alignment (in bytes) for Constant Buffer Views (CBV).
		\see BufferViewDescriptor::offset
		\see BufferViewDescriptor::size
		*/
		public var minConstantBufferAlignment:uint          = 0;

		/**
		\brief Specifies the minimum alignment (in bytes) for sampled buffers, aka. Shader Resource Views (SRV).
		\see BufferViewDescriptor::offset
		\see BufferViewDescriptor::size
		*/
		public var minSampledBufferAlignment:uint           = 0;

		/**
		\brief Specifies the minimum alignment (in bytes) for storage buffers, aka. Unordered Access Views (UAV).
		\see BufferViewDescriptor::offset
		\see BufferViewDescriptor::size
		*/
		public var minStorageBufferAlignment:uint           = 0;

		/**
		\brief Specifies the maximum number of samples for color buffers. Common values are 4, 8, 16, or 32.
		\remarks Most renderers will return at least a value of 4.
		\see RenderPassDescriptor::samples
		\see RenderTargetDescriptor::samples
		\see TextureDescriptor::samples
		*/
		public var maxColorBufferSamples:int               = 0;

		/**
		\brief Specifies the maximum number of samples for depth buffers. Common values are 4, 8, 16, or 32.
		\remarks Most renderers will return at least a value of 4.
		\see RenderPassDescriptor::samples
		\see RenderTargetDescriptor::samples
		\see TextureDescriptor::samples
		*/
		public var maxDepthBufferSamples:int               = 0;

		/**
		\brief Specifies the maximum number of samples for stencil buffers. Common values are 4, 8, 16, or 32.
		\remarks Most renderers will return at least a value of 4.
		\see RenderPassDescriptor::samples
		\see RenderTargetDescriptor::samples
		\see TextureDescriptor::samples
		*/
		public var maxStencilBufferSamples:int             = 0;

		/**
		\brief Specifies the maximum number of samples for a RenderTarget with no attachments. Common values are 4, 8, 16, or 32.
		\remarks Most renderers will return at least a value of 4.
		\see RenderTargetDescriptor::samples
		*/
		public var maxNoAttachmentSamples:int              = 0;
	}

}