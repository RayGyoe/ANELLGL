package llgl {
    
    /**
     * ...
     * @author Ray.eDoctor
     */
    public  class Viewport {
        //!< X coordinate of the left-top origin. By default 0.0.
        public var x:Number = 0;
        
        //!< Y coordinate of the left-top origin. By default 0.0.
        public var y:Number = 0;
        
        /**
           \brief Width of the right-bottom size. By default 0.0.
           \remarks Setting a viewport of negative width results in undefined behavior.
         */
        public var width:Number = 0;
        
        /**
           \brief Height of the right-bottom size. By default 0.0.
           \remarks Setting a viewport of negative height results in undefined behavior.
         */
        public var height:Number = 0;
        
        /**
           \brief Minimum of the depth range. Must be in the range [0, 1]. By default 0.0.
           \remarks Reverse mappings such as <code>minDepth=1</code> and <code>maxDepth=0</code> are also valid.
         */
        public var minDepth:Number = 0;
        
        /**
           \brief Maximum of the depth range. Must be in the range [0, 1]. By default 1.0.
           \remarks Reverse mappings such as <code>minDepth=1</code> and <code>maxDepth=0</code> are also valid.
         */
        public var maxDepth:Number = 1;
        
        public function Viewport(x:Number,y:Number,width:Number,height:Number,minDepth:Number=0,maxDepth:Number=1) {
			
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
			this.minDepth = minDepth;
			this.maxDepth = maxDepth;
        }
    
    }

}