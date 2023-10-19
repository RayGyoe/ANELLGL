package llgl
{
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class ClearFlags
	{
		public static const Color:int = (1 << 0);                    //!< Clears the color attachment.
		public static const Depth:int = (1 << 1);                     //!< Clears the depth attachment.
		public static const Stencil:int = (1 << 2);                     //!< Clears the stencil attachment.
		
		public static const ColorDepth:int = (Color | Depth);              //!< Clears the color and depth attachments.
		public static const DepthStencil:int = (Depth | Stencil);            //!< Clears the depth and stencil attachments.
		public static const All:int = (Color | Depth | Stencil);    //!< Clears the color, depth and stencil attachments.
	}
}