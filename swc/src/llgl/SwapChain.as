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
		private var _ctx:ExtensionContext;
		
		private var _renderSystem:RenderSystem;
		
		public function SwapChain(ctx:ExtensionContext, renderSystem:RenderSystem)
		{
			_ctx = ctx;
			if (!_ctx)
			{
				throw Error("ANE not init, Initialize from ANELLGL.RenderSystem");
			}
			_renderSystem = renderSystem;
		}
		
		public function SetVsyncInterval(vsyncInterval:int):Boolean
		{
			return _ctx.call("SwapChain_Function", _renderSystem.GetRendererIndex(), "SetVsyncInterval", vsyncInterval) as Boolean;
		}
		
		public function GLWindowToNativeWindow(nativeWindow:NativeWindow,x:int=0,y:int =0):void{
			_ctx.call("SwapChain_Function", _renderSystem.GetRendererIndex(), "GLWindowToNativeWindow", nativeWindow, x, y);
		}
	}

}