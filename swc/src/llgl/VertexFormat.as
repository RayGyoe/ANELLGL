package llgl 
{
	/**
	 * ...
	 * @author Ray.lei
	 */
	public final class VertexFormat 
	{
		public var attributes:Vector.<VertexAttribute>= new Vector.<VertexAttribute>();
		
		
		public function AppendAttribute(attrib:VertexAttribute):void{
			
			attributes.push(attrib);
			var last:VertexAttribute = attributes[attributes.length - 1];
			
			 if (attributes.length > 1)
			 {
				 var prev:VertexAttribute = attributes[attributes.length - 2];
				 last.location   = prev.location + 1;
				 last.offset     = prev.offset + prev.GetSize();
			 }
			 else
			 {
				 last.location   = 0;
				 last.offset     = 0;
			 }
		}
		
		public function GetStride(slot:int = -1):int{
			
			if (slot ==-1){
				return attributes.length?attributes[0].stride : 0;
			}			
			var i:int = attributes.length;
			while (--i >-1){
				if (attributes[i].slot == slot)
				{
					return attributes[i].stride;
				}
			}
			return 0;
		}
		
		public function SetStride(stride:int, slot:int = -1) :void
		{
			var i:int = attributes.length;
			while (--i >-1){
				
				if (slot != -1)
				{
					if (attributes[i].slot == slot){
						attributes[i].stride = stride;
						break;
					}
				}else{
					attributes[i].stride = stride;
				}
				
			}
		}
		public function SetSlot(slot:int) :void
		{
			var i:int = attributes.length;
			while (--i >-1){
				attributes[i].slot = slot;
			}
		}
		
	}

}