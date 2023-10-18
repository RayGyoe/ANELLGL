package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class BufferDescriptor 
	{
		
		/**
		\brief Buffer size (in bytes). This must not be larger than RenderingLimits::maxBufferSize. By default 0.
		\remarks If \c stride is greater than zero, then \c size \b must be a multiple of \c stride.
		\see RenderingLimits::maxBufferSize
		\see bindFlags
		*/
		public var              size:uint            = 0;

		/**
		\brief Optional stride for structured buffers. By default 0.
		\remarks This is only used for Direct3D structured buffer, i.e. \c StructuredBuffer, \c RWStructuredBuffer, \c AppendStructuredBuffer, and \c ConsumeStructuredBuffer in HLSL.
		\remarks If this is non-zero, the \c format attribute is ignored for sampled and storage buffers, i.e. buffers with the binding flags BindFlags::Sampled or BindFlags::Storage.
		\note If the buffer has the binding flag BindFlags::IndirectBuffer, this \b must be 0.
		\note Only supported with: Direct3D 11, Direct3D 12.
		\see MiscFlags::Append
		\see MiscFlags::Counter
		*/
		public var               stride:int          = 0;

		/**
		\brief Optioanl hardware buffer format. By default Format::Undefined.
		\remarks This is used for index buffers, typed buffers (e.g. \c Buffer<uint4> and \c RWBuffer<float4> in HLSL), and byte address buffers (i.e. \c ByteAddressBuffer and \c RWByteAddressBuffer in HLSL).
		\remarks This field is ignored if the binding flags do not contain at least one of the following bits: BindFlags::IndexBuffer, BindFlags::Sampled, or BindFlags::Storage.
		\remarks If the BindFlags::IndexBuffer bit is set, this must be either Format::R16UInt, Format::R32UInt, or Format::Undefined.
		\remarks If Format::Undefined is specified and the BindFlags::IndexBuffer bit is set, only the secondary \c SetIndexBuffer function can be used in the CommandBuffer interface.
		\remarks If Format::Undefined is specified and \c stride is zero, sampled and storage buffers
		(i.e. buffer views with BindFlags::Sampled and BindFlags::Storage respectively) will be interpreted as byte address buffers.
		\see BindFlags::IndexBuffer
		\see CommandBuffer::SetIndexBuffer(Buffer&)
		*/
		public var                      format:int          = Format.Undefined;

		/**
		\brief These flags describe to which resource slots the buffer can be bound. By default 0.
		\remarks When the buffer will be bound to a vertex buffer slot for instance, the BindFlags::VertexBuffer flag is required.
		\see BindFlags
		*/
		public var                        bindFlags:int       = BindFlags.None;

		/**
		\brief CPU read/write access flags. By default 0.
		\remarks If this is 0 the buffer cannot be mapped between GPU and CPU memory space.
		\see CPUAccessFlags
		\see RenderSystem::MapBuffer
		\see RenderSystem::ReadBuffer
		\see RenderSystem::WriteBuffer
		*/
		public var                         cpuAccessFlags:int  = CPUAccessFlags.None;

		/**
		\brief Miscellaneous buffer flags. By default 0.
		\remarks This can be used as a hint for the renderer how frequently the buffer will be updated.
		\see MiscFlags
		*/
		public var                        miscFlags:int       = MiscFlags.None;

		/**
		\brief Specifies the list of vertex attributes.
		\remarks This is only used for vertex buffers and ignored if \c bindFlags does not contain the BindFlags::VertexBuffer bit.
		\see BindFlags::VertexBuffer
		\see VertexShaderAttributes::inputAttribs
		*/
		public var vertexAttribs:Vector.<VertexAttribute>;
		
	}

}