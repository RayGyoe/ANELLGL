package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class ShadingLanguage
	{
		
		public static const GLSL:int            = (0x10000);        //!< GLSL (OpenGL Shading Language).
		public static const GLSL_110:int        = (0x10000 | 110);  //!< GLSL 1.10 (since OpenGL 2.0).
		public static const GLSL_120:int        = (0x10000 | 120);  //!< GLSL 1.20 (since OpenGL 2.1).
		public static const GLSL_130:int        = (0x10000 | 130);  //!< GLSL 1.30 (since OpenGL 3.0).
		public static const GLSL_140:int        = (0x10000 | 140);  //!< GLSL 1.40 (since OpenGL 3.1).
		public static const GLSL_150:int        = (0x10000 | 150);  //!< GLSL 1.50 (since OpenGL 3.2).
		public static const GLSL_330:int        = (0x10000 | 330);  //!< GLSL 3.30 (since OpenGL 3.3).
		public static const GLSL_400:int        = (0x10000 | 400);  //!< GLSL 4.00 (since OpenGL 4.0).
		public static const GLSL_410:int        = (0x10000 | 410);  //!< GLSL 4.10 (since OpenGL 4.1).
		public static const GLSL_420:int        = (0x10000 | 420);  //!< GLSL 4.20 (since OpenGL 4.2).
		public static const GLSL_430:int        = (0x10000 | 430);  //!< GLSL 4.30 (since OpenGL 4.3).
		public static const GLSL_440:int        = (0x10000 | 440);  //!< GLSL 4.40 (since OpenGL 4.4).
		public static const GLSL_450:int        = (0x10000 | 450);  //!< GLSL 4.50 (since OpenGL 4.5).
		public static const GLSL_460:int        = (0x10000 | 460);  //!< GLSL 4.60 (since OpenGL 4.6).

		public static const ESSL:int            = (0x20000);        //!< ESSL (OpenGL ES Shading Language).
		public static const ESSL_100:int        = (0x20000 | 100);  //!< ESSL 1.00 (since OpenGL ES 2.0).
		public static const ESSL_300:int        = (0x20000 | 300);  //!< ESSL 3.00 (since OpenGL ES 3.0).
		public static const ESSL_310:int        = (0x20000 | 310);  //!< ESSL 3.10 (since OpenGL ES 3.1).
		public static const ESSL_320:int       = (0x20000 | 320);  //!< ESSL 3.20 (since OpenGL ES 3.2).

		public static const HLSL:int            = (0x30000);        //!< HLSL (High Level Shading Language).
		public static const HLSL_2_0:int        = (0x30000 | 200);  //!< HLSL 2.0 (since Direct3D 9).
		public static const HLSL_2_0a:int       = (0x30000 | 201);  //!< HLSL 2.0a (since Direct3D 9a).
		public static const HLSL_2_0b:int      = (0x30000 | 202);  //!< HLSL 2.0b (since Direct3D 9b).
		public static const HLSL_3_0:int        = (0x30000 | 300);  //!< HLSL 3.0 (since Direct3D 9c).
		public static const HLSL_4_0:int        = (0x30000 | 400);  //!< HLSL 4.0 (since Direct3D 10).
		public static const HLSL_4_1:int        = (0x30000 | 410);  //!< HLSL 4.1 (since Direct3D 10.1).
		public static const HLSL_5_0:int        = (0x30000 | 500);  //!< HLSL 5.0 (since Direct3D 11).
		public static const HLSL_5_1:int        = (0x30000 | 510);  //!< HLSL 5.1 (since Direct3D 11.3).
		public static const HLSL_6_0:int        = (0x30000 | 600);  //!< HLSL 6.0 (since Direct3D 12). Shader model 6.0 adds wave intrinsics and 64-bit integer types to HLSL.
		public static const HLSL_6_1:int        = (0x30000 | 601);  //!< HLSL 6.1 (since Direct3D 12). Shader model 6.1 adds \c SV_ViewID and \c SV_Barycentrics semantics to HLSL.
		public static const HLSL_6_2:int        = (0x30000 | 602);  //!< HLSL 6.2 (since Direct3D 12). Shader model 6.2 adds 16-bit scalar types to HLSL.
		public static const HLSL_6_3:int        = (0x30000 | 603);  //!< HLSL 6.3 (since Direct3D 12). Shader model 6.3 adds ray tracing (DXR) to HLSL.
		public static const HLSL_6_4:int        = (0x30000 | 604);  //!< HLSL 6.4 (since Direct3D 12). Shader model 6.4 adds machine learning intrinsics to HLSL.

		public static const Metal:int           = (0x40000);        //!< Metal Shading Language.
		public static const Metal_1_0:int       = (0x40000 | 100);  //!< Metal 1.0 (since iOS 8.0).
		public static const Metal_1_1:int       = (0x40000 | 110);  //!< Metal 1.1 (since iOS 9.0 and OS X 10.11).
		public static const Metal_1_2:int       = (0x40000 | 120);  //!< Metal 1.2 (since iOS 10.0 and macOS 10.12).
		public static const Metal_2_0:int       = (0x40000 | 200);  //!< Metal 2.0 (since iOS 11.0 and macOS 10.13).
		public static const Metal_2_1:int       = (0x40000 | 210);  //!< Metal 2.1 (since iOS 12.0 and macOS 10.14).

		public static const SPIRV:int           = (0x50000);        //!< SPIR-V Shading Language.
		public static const SPIRV_100:int       = (0x50000 | 100);  //!< SPIR-V 1.0.

		public static const VersionBitmask:int  = 0x0000ffff;       //!< Bitmask for the version number of each shading language enumeration entry.
		
	}

}