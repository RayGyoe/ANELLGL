package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public class SwapChainDescriptor 
	{
		
		/**
		\brief Screen resolution (in pixels).
		\remarks If the resolution contains a member with a value of 0, the video mode is invalid.
		\see RenderTarget::GetResolution
		*/
		public var width:int = 800;
		public var height:int = 600;

		/**
		\brief Number of bits for each pixel in the color buffer. Should be 24 or 32. By default 32.
		\remarks This is only a hint to the renderer and there is no guarantee which hardware format is finally used for the color buffer.
		To determine the actual color format of a swap-chain, use the SwapChain::GetColorFormat function.
		\see SwapChain::GetColorFormat
		*/
		public var colorBits:int       = 32;

		/**
		\brief Number of bits for each pixel in the depth buffer. Should be 24, 32, or zero to disable depth buffer. By default 24.
		\remarks This is only a hint to the renderer and there is no guarantee which hardware format is finally used for the depth buffer.
		To determine the actual depth-stencil format of a swap-chain, use the SwapChain::GetDepthStencilFormat function.
		\see SwapChain::GetDepthStencilFormat
		*/
		public var depthBits:int       = 24;

		/**
		\brief Number of bits for each pixel in the stencil buffer. Should be 8, or zero to disable stencil buffer. By default 8.
		\remarks This is only a hint to the renderer and there is no guarantee which hardware format is finally used for the stencil buffer.
		To determine the actual depth-stencil format of a swap-chain, use the SwapChain::GetDepthStencilFormat function.
		\see SwapChain::GetDepthStencilFormat
		*/
		public var stencilBits:int     = 8;

		/**
		\brief Number of samples for the swap-chain buffers. By default 1.
		\remarks If the specified number of samples is not supported, LLGL will silently reduce it.
		The actual number of samples can be queried by the \c GetSamples function of the RenderTarget interface.
		\see RenderTarget::GetSamples
		*/
		public var samples:int         = 1;

		/**
		\brief Number of swap buffers. By default 2 (for double-buffering).
		\remarks This is only a hint to the renderer and there is no guarantee how many buffers are finally used for the swap chain.
		Especially OpenGL does not support custom swap chain sizes.
		\see SwapChain::GetCurrentSwapIndex
		\see SwapChain::GetNumSwapBuffers
		*/
		public var swapBuffers:int     = 2;

		//! Specifies whether to enable fullscreen mode or windowed mode. By default windowed mode.
		public var fullscreen:Boolean      = false;
		
	}

}