package llgl
{
	import flash.display.NativeWindow;
	import flash.external.ExtensionContext;
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public class SwapChain
	{
		private var _SwapChainPtr:Number;
		
		
		private var _rendererIndex:int;
		public function get SwapChainPtr():Number 
		{
			return _SwapChainPtr;
		}
		
		public function get rendererIndex():int 
		{
			return _rendererIndex;
		}
		
		
		public function SwapChain(SwapChainPtr:Number, rendererIndex:int)
		{
			_SwapChainPtr = SwapChainPtr;
			_rendererIndex = rendererIndex;
		}
		
		public function SetVsyncInterval(vsyncInterval:int):Boolean
		{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("SwapChain_Function", _rendererIndex, "SetVsyncInterval", vsyncInterval) as Boolean;
			}
			return false;
		}
		
		public function GLWindowToNativeWindow(nativeWindow:NativeWindow,x:int=0,y:int =0):void{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("SwapChain_Function", _rendererIndex, "GLWindowToNativeWindow", nativeWindow, x, y);
			}
		}
		
		public function Present():void{
			if (ANELLGL.getInstance().isSupported)
			{
				ANELLGL.getInstance().context.call("SwapChain_Function", _rendererIndex, "Present");
			}
		}
	}

}