package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class CPUAccessFlags
	{
		public static const None:int        = 0;
		public static const Read:int        = (1 << 0);
		public static const Write:int       = (1 << 1);
		public static const ReadWrite:int   = (Read | Write);
	}

}