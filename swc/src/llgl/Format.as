package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class Format 
	{
		
		public static const Undefined:int = 0;         //!< Undefined format.

		  /* --- Alpha channel color formats --- */
		public static const A8UNorm:int = 1;            //!< Alpha channel format: alpha 8-bit normalized unsigned integer component.

		  /* --- Red channel color formats --- */
		public static const  R8UNorm:int = 2;            //!< Ordinary color format: red 8-bit normalized unsigned integer component.
		public static const  R8SNorm:int = 3;            //!< Ordinary color format: red 8-bit normalized signed integer component.
		public static const  R8UInt:int = 4;             //!< Ordinary color format: red 8-bit unsigned integer component.
		public static const  R8SInt:int = 5;             //!< Ordinary color format: red 8-bit signed integer component.

		public static const  R16UNorm:int = 6;           //!< Ordinary color format: red 16-bit normalized unsigned interger component.
		public static const  R16SNorm:int = 7;           //!< Ordinary color format: red 16-bit normalized signed interger component.
		public static const  R16UInt:int = 8;            //!< Ordinary color format: red 16-bit unsigned interger component.
		public static const  R16SInt:int = 9;            //!< Ordinary color format: red 16-bit signed interger component.
		public static const  R16Float:int = 10;           //!< Ordinary color format: red 16-bit floating point component.

		public static const  R32UInt:int = 11;            //!< Ordinary color format: red 32-bit unsigned interger component.
		public static const  R32SInt:int = 12;            //!< Ordinary color format: red 32-bit signed interger component.
		public static const  R32Float:int = 13;           //!< Ordinary color format: red 32-bit floating point component.

		public static const  R64Float:int =14;           //!< Ordinary color format: red 64-bit floating point component. \note Only supported with: Vulkan.

		  /* --- RG color formats --- */
		public static const  RG8UNorm:int = 15;           //!< Ordinary color format: red, green 8-bit normalized unsigned integer components.
		public static const  RG8SNorm:int = 16;           //!< Ordinary color format: red, green 8-bit normalized signed integer components.
		public static const  RG8UInt:int = 17;            //!< Ordinary color format: red, green 8-bit unsigned integer components.
		public static const  RG8SInt:int = 18;            //!< Ordinary color format: red, green 8-bit signed integer components.

		public static const  RG16UNorm:int = 19;          //!< Ordinary color format: red, green 16-bit normalized unsigned interger components.
		public static const  RG16SNorm:int = 20;          //!< Ordinary color format: red, green 16-bit normalized signed interger components.
		public static const  RG16UInt:int = 21;           //!< Ordinary color format: red, green 16-bit unsigned interger components.
		public static const  RG16SInt:int = 22;          //!< Ordinary color format: red, green 16-bit signed interger components.
		public static const  RG16Float:int = 23;          //!< Ordinary color format: red, green 16-bit floating point components.

		public static const  RG32UInt:int = 24;           //!< Ordinary color format: red, green 32-bit unsigned interger components.
		public static const  RG32SInt:int = 25;           //!< Ordinary color format: red, green 32-bit signed interger components.
		public static const  RG32Float:int = 26;          //!< Ordinary color format: red, green 32-bit floating point components.

		public static const  RG64Float:int = 27;          //!< Ordinary color format: red, green 64-bit floating point components. \note Only supported with: Vulkan.

		  /* --- RGB color formats --- */
		public static const  RGB8UNorm:int = 28;          //!< Ordinary color format: red, green, blue 8-bit normalized unsigned integer components. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB8UNorm_sRGB:int = 29;     //!< Ordinary color format: red, green, blue 8-bit normalized unsigned integer components in non-linear sRGB color space. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB8SNorm:int = 30;          //!< Ordinary color format: red, green, blue 8-bit normalized signed integer components. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB8UInt:int = 31;           //!< Ordinary color format: red, green, blue 8-bit unsigned integer components. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB8SInt:int = 32;           //!< Ordinary color format: red, green, blue 8-bit signed integer components. \note Only supported with: OpenGL, Vulkan.

		public static const  RGB16UNorm:int = 33;         //!< Ordinary color format: red, green, blue 16-bit normalized unsigned interger components. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB16SNorm:int = 34;         //!< Ordinary color format: red, green, blue 16-bit normalized signed interger components. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB16UInt:int = 35;          //!< Ordinary color format: red, green, blue 16-bit unsigned interger components. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB16SInt:int = 36;          //!< Ordinary color format: red, green, blue 16-bit signed interger components. \note Only supported with: OpenGL, Vulkan.
		public static const  RGB16Float:int = 37;         //!< Ordinary color format: red, green, blue 16-bit floating point components. \note Only supported with: OpenGL, Vulkan.

		public static const  RGB32UInt:int = 38;          //!< Ordinary color format: red, green, blue 32-bit unsigned interger components. \note As texture format only supported with: OpenGL, Vulkan, Direct3D 11, Direct3D 12.
		public static const  RGB32SInt:int = 39;          //!< Ordinary color format: red, green, blue 32-bit signed interger components. \note As texture format only supported with: OpenGL, Vulkan, Direct3D 11, Direct3D 12.
		public static const  RGB32Float:int = 40;         //!< Ordinary color format: red, green, blue 32-bit floating point components. \note As texture format only supported with: OpenGL, Vulkan, Direct3D 11, Direct3D 12.

		public static const  RGB64Float:int = 41;         //!< Ordinary color format: red, green, blue 64-bit floating point components. \note Only supported with: Vulkan.

		  /* --- RGBA color formats --- */
		public static const  RGBA8UNorm:int = 42;         //!< Ordinary color format: red, green, blue, alpha 8-bit normalized unsigned integer components.
		public static const  RGBA8UNorm_sRGB:int = 43;    //!< Ordinary color format: red, green, blue, alpha 8-bit normalized unsigned integer components in non-linear sRGB color space.
		public static const  RGBA8SNorm:int = 44;         //!< Ordinary color format: red, green, blue, alpha 8-bit normalized signed integer components.
		public static const  RGBA8UInt:int = 45;          //!< Ordinary color format: red, green, blue, alpha 8-bit unsigned integer components.
		public static const  RGBA8SInt:int = 46;          //!< Ordinary color format: red, green, blue, alpha 8-bit signed integer components.

		public static const  RGBA16UNorm:int = 47;        //!< Ordinary color format: red, green, blue, alpha 16-bit normalized unsigned interger components.
		public static const  RGBA16SNorm:int = 48;        //!< Ordinary color format: red, green, blue, alpha 16-bit normalized signed interger components.
		public static const  RGBA16UInt:int = 49;         //!< Ordinary color format: red, green, blue, alpha 16-bit unsigned interger components.
		public static const  RGBA16SInt:int = 50;         //!< Ordinary color format: red, green, blue, alpha 16-bit signed interger components.
		public static const  RGBA16Float:int = 51;        //!< Ordinary color format: red, green, blue, alpha 16-bit floating point components.

		public static const  RGBA32UInt:int = 52;         //!< Ordinary color format: red, green, blue, alpha 32-bit unsigned interger components.
		public static const  RGBA32SInt:int = 53;         //!< Ordinary color format: red, green, blue, alpha 32-bit signed interger components.
		public static const  RGBA32Float:int = 54;        //!< Ordinary color format: red, green, blue, alpha 32-bit floating point components.

		public static const  RGBA64Float:int = 55;        //!< Ordinary color format: red, green, blue, alpha 64-bit floating point components. \note Only supported with: Vulkan.

		  /* --- BGRA color formats --- */
		public static const  BGRA8UNorm:int = 56;         //!< Ordinary color format: blue, green, red, alpha 8-bit normalized unsigned integer components.
		public static const  BGRA8UNorm_sRGB:int = 57;    //!< Ordinary color format: blue, green, red, alpha 8-bit normalized unsigned integer components in non-linear sRGB color space.
		public static const  BGRA8SNorm:int = 58;         //!< Ordinary color format: blue, green, red, alpha 8-bit normalized signed integer components. \note Only supported with: Vulkan.
		public static const  BGRA8UInt:int = 59;          //!< Ordinary color format: blue, green, red, alpha 8-bit unsigned integer components. \note Only supported with: Vulkan.
		public static const  BGRA8SInt:int = 60;         //!< Ordinary color format: blue, green, red, alpha 8-bit signed integer components. \note Only supported with: Vulkan.

		  /* --- Packed formats --- */
		public static const  RGB10A2UNorm:int = 61;      //!< Packed color format: red, green, blue 10-bit and alpha 2-bit normalized unsigned integer components.
		public static const  RGB10A2UInt:int = 61;        //!< Packed color format: red, green, blue 10-bit and alpha 2-bit unsigned integer components.
		public static const  RG11B10Float:int = 63;       //!< Packed color format: red, green 11-bit and blue 10-bit unsigned floating point, i.e. 6-bit mantissa for red and green, 5-bit mantissa for blue, and 5-bit exponent for all components.
		public static const  RGB9E5Float:int = 64;        //!< Packed color format: red, green, blue 9-bit unsigned floating-point with shared 5-bit exponent, i.e. 9-bit mantissa for each component and one 5-bit exponent for all components.

		  /* --- Depth-stencil formats --- */
		public static const  D16UNorm:int = 65;           //!< Depth-stencil format: depth 16-bit normalized unsigned integer component.
		public static const  D24UNormS8UInt:int = 66;     //!< Depth-stencil format: depth 24-bit normalized unsigned integer component, and 8-bit unsigned integer stencil component.
		public static const  D32Float:int = 67;           //!< Depth-stencil format: depth 32-bit floating point component.
		public static const  D32FloatS8X24UInt:int = 68;  //!< Depth-stencil format: depth 32-bit floating point component, and 8-bit unsigned integer stencil components (where the remaining 24 bits are unused).
		//S8UInt,             //!< Stencil only format: 8-bit unsigned integer stencil component. \note Only supported with: OpenGL, Vulkan, Metal.

		  /* --- Block compression (BC) formats --- */
		public static const  BC1UNorm:int = 69;           //!< Compressed color format: S3TC BC1 compressed RGBA with normalized unsigned integer components in 64-bit per 4x4 block.
		public static const  BC1UNorm_sRGB:int = 70;      //!< Compressed color format: S3TC BC1 compressed RGBA with normalized unsigned integer components in 64-bit per 4x4 block in non-linear sRGB color space.
		public static const  BC2UNorm:int = 71;           //!< Compressed color format: S3TC BC2 compressed RGBA with normalized unsigned integer components in 128-bit per 4x4 block.
		public static const  BC2UNorm_sRGB:int = 72;      //!< Compressed color format: S3TC BC2 compressed RGBA with normalized unsigned integer components in 128-bit per 4x4 block in non-linear sRGB color space.
		public static const  BC3UNorm:int = 73;           //!< Compressed color format: S3TC BC3 compressed RGBA with normalized unsigned integer components in 128-bit per 4x4 block.
		public static const  BC3UNorm_sRGB:int = 74;      //!< Compressed color format: S3TC BC3 compressed RGBA with normalized unsigned integer components in 128-bit per 4x4 block in non-linear sRGB color space.
		public static const  BC4UNorm:int = 75;           //!< Compressed color format: S3TC BC4 compressed red channel with normalized unsigned integer component in 64-bit per 4x4 block.
		public static const  BC4SNorm:int = 76;           //!< Compressed color format: S3TC BC4 compressed red channel with normalized signed integer component 64-bit per 4x4 block.
		public static const  BC5UNorm:int = 77;          //!< Compressed color format: S3TC BC5 compressed red and green channels with normalized unsigned integer components in 64-bit per 4x4 block.
		public static const  BC5SNorm:int = 78;           //!< Compressed color format: S3TC BC5 compressed red and green channels with normalized signed integer components in 128-bit per 4x4 block.
				
	}

}