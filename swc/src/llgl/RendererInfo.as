package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public class RendererInfo 
	{
		//! Rendering API name and version (e.g. "OpenGL 4.6").
		public var rendererName:String;
		
		//! Renderer device name (e.g. "GeForce GTX 1070/PCIe/SSE2").
		public var deviceName:String;

		//! Vendor name of the renderer device (e.g. "NVIDIA Corporation").
		public var vendorName:String;

		//! Shading language version (e.g. "GLSL 4.50").
		public var shadingLanguageName:String;

		//! List of enabled renderer extensions (e.g. "GL_ARB_direct_state_access" or "VK_EXT_conditional_rendering").
		public var extensionNames:Vector.<String> = new Vector.<String>();
	}

}