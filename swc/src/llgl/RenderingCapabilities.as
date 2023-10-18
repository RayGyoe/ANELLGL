package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class RenderingCapabilities
	{
		
		/**
		\brief Screen coordinate system origin.
		\remarks This determines the native coordinate space of viewports, scissors, and framebuffers.
		If the native screen origin is lower-left, LLGL emulates it to always maintain the upper-left as the screen origin.
		*/
		public var screenOrigin:int;

		//! Specifies the clipping depth range.
		public var clippingRange:int;

		/**
		\brief Specifies the list of supported shading ShadingLanguage.
		\remarks This also specifies whether shaders can be loaded in source or binary form (using "Compile" or "LoadBinary" functions of the "Shader" interface).
		\see Shader::Compile
		\see Shader::LoadBinary
		*/
		public var shadingLanguages:Vector.<int> = new Vector.<int>();

		/**
		\brief Specifies the list of supported hardware texture formats. Format
		\see Format
		*/
		public var textureFormats:Vector.<int>  = new Vector.<int>();

		/**
		\brief Specifies all supported hardware features.
		\remarks Especially with OpenGL these features can vary between different hardware and GL versions.
		*/
		public var features:RenderingFeatures;
		
		/**
		\brief Specifies all rendering limitations.
		\remarks Especially with OpenGL these features can vary between different hardware and GL versions.
		*/
		public var limits:RenderingLimits;
		
	}

}