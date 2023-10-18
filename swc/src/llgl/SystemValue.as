package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class SystemValue 
	{
		
		//! Undefined system value.
		public static const Undefined:int = 0;

		//! Forward-compatible mechanism for vertex clipping.
		public static const ClipDistance:int = 1;

		//! Fragment output color value.
		public static const Color:int = 2;

		//! Mechanism for controlling user culling.
		public static const CullDistance:int = 3;

		//! Fragment depth value.
		public static const Depth:int = 4;

		//! Fragment depth value that is greater than or equal to the previous one.
		public static const DepthGreater:int = 5;

		//! Fragment depth value that is less than or equal to the previous one.
		public static const DepthLess:int = 6;

		//! Indicates whether a primitive is front or back facing.
		public static const FrontFacing:int = 7;

		/**
		\brief Index of the input instance.
		\note This value behalves differently between Direct3D and OpenGL.
		\see CommandBuffer::DrawInstanced(std::uint32_t, std::uint32_t, std::uint32_t, std::uint32_t)
		*/
		public static const InstanceID:int = 8;

		//! Vertex or fragment position.
		public static const Position:int = 9;

		//! Index of the geometry primitive.
		public static const PrimitiveID:int = 10;

		//! Index of the render target layer.
		public static const RenderTargetIndex:int = 11;

		//! Sample coverage mask.
		public static const SampleMask:int = 12;

		//! Index of the input sample.
		public static const SampleID:int = 13;

		/**
		\brief Fragment stencil value.
		\note Only supported with: Direct3D 11.3, Direct3D 12, Metal.
		*/
		public static const Stencil:int = 14;

		/**
		\brief Index of the input vertex.
		\note This value behalves differently between Direct3D and OpenGL.
		\see CommandBuffer::Draw
		*/
		public static const VertexID:int = 15;

		//! Index of the viewport array.
		public static const ViewportIndex:int = 16;
		
	}

}