package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class RenderingFeatures
	{
		
		//! Specifies whether render targets (also "framebuffer objects") are supported.
		public var hasRenderTargets:Boolean               = false;

		/**
		\brief Specifies whether 3D textures are supported.
		\see TextureType::Texture3D
		*/
		public var has3DTextures:Boolean                 = false;

		/**
		\brief Specifies whether cube textures are supported.
		\see TextureType::TextureCube
		*/
		public var hasCubeTextures:Boolean                = false;

		/**
		\brief Specifies whether 1D- and 2D array textures are supported.
		\see TextureType::Texture1DArray
		\see TextureType::Texture2DArray
		*/
		public var hasArrayTextures:Boolean               = false;

		/**
		\brief Specifies whether cube array textures are supported.
		\remarks This implies RenderingFeatures::hasCubeTextures to be true as well.
		\see TextureType::TextureCubeArray
		*/
		public var hasCubeArrayTextures:Boolean           = false;

		/**
		\brief Specifies whether multi-sample textures are supported.
		\see TextureType::Texture2DMS
		*/
		public var hasMultiSampleTextures:Boolean         = false;

		/**
		\brief Specifies whether multi-sample array textures are supported.
		\remarks This implies RenderingFeatures::hasMultiSampleTextures to be true as well.
		\see TextureType::Texture2DMSArray
		*/
		public var hasMultiSampleArrayTextures:Boolean    = false;

		/**
		\brief Specifies whether texture views are supported.
		\remarks Texture views can share their image data with another texture resource in a different range and format.
		\see TextureViewDescriptor
		*/
		public var hasTextureViews:Boolean                = false;

		/**
		\brief Specifies whether texture views can have swizzling (a.k.a. component mapping).
		\remarks This feature implies that \c hasTextureViews is true.
		\note Only supported with: Direct3D 12, Vulkan, OpenGL, Metal.
		\see TextureViewDescriptor::swizzle
		*/
		public var hasTextureViewSwizzle:Boolean          = false;

		/**
		\brief Specifies whether buffer views are supported.
		\remarks Buffer views can shared their data with another buffer resource in a different range and format.
		\see BufferViewDescriptor
		*/
		public var hasBufferViews:Boolean                 = false;

		//! Specifies whether samplers are supported.
		//! \todo Rename to \c hasNativeSamplerStates or remove entirely.
		public var hasSamplers:Boolean                    = false;

		/**
		\brief Specifies whether constant buffers (also "uniform buffer objects") are supported.
		\see BindFlags::ConstantBuffer
		*/
		public var hasConstantBuffers:Boolean             = false;

		/**
		\brief Specifies whether storage buffers (also "read/write buffers") are supported.
		\see BindFlags::Sampled
		\see BindFlags::Storage
		*/
		public var hasStorageBuffers:Boolean              = false;

		/**
		\brief Specifies whether individual shader uniforms are supported.
		\note Only supported with: OpenGL.
		\see CommandBuffer::SetUniform
		\see CommandBuffer::SetUniforms
		*/
		public var hasUniforms:Boolean                    = false;

		/**
		\brief Specifies whether geometry shaders are supported.
		\see ShaderType::Geometry
		*/
		public var hasGeometryShaders:Boolean             = false;

		/**
		\brief Specifies whether tessellation shaders are supported.
		\remarks This feature implies that \c hasTessellatorStage is true.
		\note Only supported with: Direct3D 12, Direct3D 11, Vulkan, OpenGL.
		\see ShaderType::TessControl
		\see ShaderType::TessEvaluation
		*/
		public var hasTessellationShaders:Boolean         = false;

		/**
		\brief Specifies whether tessellator stage is supported.
		\remarks The Metal backend supports a tessellator stage but no dedicated tessellation shaders.
		The tessellation control shader and the tessellation evaluation shader are usually defined
		by a compute kernel and a post-tessellation vertex function respectively.
		\see TessellationDescriptor.
		*/
		public var hasTessellatorStage:Boolean            = false;

		/**
		\brief Specifies whether compute shaders are supported.
		\see ShaderType::Compute
		\see CommandBuffer::Dispatch
		\see CommandBuffer::DispatchIndirect
		*/
		public var hasComputeShaders:Boolean              = false;

		/**
		\brief Specifies whether hardware instancing is supported.
		\see CommandBuffer::DrawInstanced(std::uint32_t, std::uint32_t, std::uint32_t)
		\see CommandBuffer::DrawIndexedInstanced(std::uint32_t, std::uint32_t, std::uint32_t)
		\see CommandBuffer::DrawIndexedInstanced(std::uint32_t, std::uint32_t, std::uint32_t, std::int32_t)
		*/
		public var hasInstancing:Boolean                  = false;

		/**
		\brief Specifies whether hardware instancing with instance offsets is supported.
		\see CommandBuffer::DrawInstanced(std::uint32_t, std::uint32_t, std::uint32_t, std::uint32_t)
		\see CommandBuffer::DrawIndexedInstanced(std::uint32_t, std::uint32_t, std::uint32_t, std::int32_t, std::uint32_t)
		*/
		public var hasOffsetInstancing:Boolean            = false;

		/**
		\brief Specifies whether indirect draw commands are supported.
		\see CommandBuffer::DrawIndirect
		\see CommandBuffer::DrawIndexedIndirect
		*/
		public var hasIndirectDrawing:Boolean             = false;

		/**
		\brief Specifies whether multiple viewports, depth-ranges, and scissors at once are supported.
		\see RenderingLimits::maxViewports
		*/
		public var hasViewportArrays:Boolean              = false;

		/**
		\brief Specifies whether conservative rasterization is supported.
		\see RasterizerDescriptor::conservativeRasterization
		*/
		public var hasConservativeRasterization:Boolean   = false;

		/**
		\brief Specifies whether stream-output is supported.
		\see VertexShaderAttributes::outputAttribs
		\see CommandBuffer::BeginStreamOutput
		\see RenderingLimits::maxStreamOutputs
		*/
		public var hasStreamOutputs:Boolean               = false;

		/**
		\brief Specifies whether logic fragment operations are supported.
		\note For Direct3D 11, feature level 11.1 is required.
		\see BlendDescriptor::logicOp
		*/
		public var hasLogicOp:Boolean                     = false;

		/**
		\brief Specifies whether queries for pipeline statistics are supported.
		\see QueryType::PipelineStatistics
		\see QueryPipelineStatistics
		*/
		public var hasPipelineStatistics:Boolean          = false;

		/**
		\brief Specifies whether queries for conditional rendering are supported.
		\see QueryHeapDescriptor::renderCondition
		\see CommandBuffer:BeginRenderCondition
		*/
		public var hasRenderCondition:Boolean             = false;
		
	}

}