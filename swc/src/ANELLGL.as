package
{
	
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import llgl.RenderSystem;
	
	/**
	 * ...
	 * @author Ray.lei
	 */
	public class ANELLGL
	{
		
		private static var _instance:ANELLGL;
		private var _extCtx:ExtensionContext;
		private var _isSupported:Boolean;
		
		private var renderers:Vector.<RenderSystem> = new Vector.<RenderSystem>();
		
		private var _actionScriptData:Object = {};
		private var _debug:Boolean;
		
		public function ANELLGL()
		{
			if (!_instance)
			{
				_extCtx = ExtensionContext.createExtensionContext("com.vsdevelop.air.extension.llgl", null);
				
				if (_extCtx != null)
				{
					
					_isSupported = _extCtx.call("isSupported") as Boolean;
					
					if (_isSupported)
					{
						_extCtx.actionScriptData = actionScriptData;
					}
					
					_extCtx.addEventListener(StatusEvent.STATUS, onStatus);
				}
				else
				{
					trace('extCtx is null.');
				}
				_instance = this;
			}
			else
			{
				throw Error('This is a singleton, use getInstance, do not call the constructor directly');
			}
		}
		
		public function get actionScriptData():Object
		{
			return _actionScriptData;
		}
		
		public static function getInstance():ANELLGL
		{
			return _instance ? _instance : new ANELLGL();
		}
		
		public function get isSupported():Boolean
		{
			return _isSupported;
		}
		
		public function get context():ExtensionContext
		{
			
			if (_isSupported) return _extCtx;
			return null;
		}
		
		public function get debug():Boolean
		{
			return _debug;
		}
		
		public function set debug(value:Boolean):void
		{
			_debug = value;
			if (_isSupported)
			{
				_extCtx.call("debug", _debug);
			}
		}
		
		private function onStatus(e:StatusEvent):void
		{
		
		}
		
		//
		public function FindModules():Vector.<String>
		{
			if (_isSupported)
			{
				return _extCtx.call("FindModules") as Vector.<String>;
			}
			return new Vector.<String>();
		}
		
		public function loadRenderSystem(renderModule:String):RenderSystem
		{
			if (_isSupported)
			{
				var rendererID:int = int(_extCtx.call("loadRenderSystem", renderers.length, renderModule));
				if (rendererID)
				{
					var render:RenderSystem = new RenderSystem(_extCtx, renderers.length, rendererID);
					renderers[renderers.length] = render;
					return render;
				}
			}
			
			return null;
		}
		
		public function dispose():void
		{
			if (_extCtx)
			{
				_extCtx.removeEventListener(StatusEvent.STATUS, onStatus);
				_extCtx.dispose();
			}
		}
	
	}

}