package code {
	
	public class Collider {
		
		//??
		private var halfWidth:Number;
		private var halfHeight:Number;
		
		public var xMin:Number;
		public var xMax:Number;
		public var yMin:Number;
		public var yMax:Number;

		public function Collider(halfWidth:Number, halfHeight:Number) {
			setSize(halfWidth, halfHeight);
		}
		public function setSize(halfWidth:Number, halfHeight:Number):void {
			this.halfWidth = halfWidth;
			this.halfHeight = halfHeight;
			
			calcCollide((xMin + xMax) / 2, (yMin + yMax) / 2);
		}
		/* Calculate the position of the 4 edgues from the center (x, y) position. */
		public function calcCollide(x:Number, y:Number):void {
			xMin = x - halfWidth;
			xMax = x + halfWidth;
			
			yMin = y - halfHeight;
			yMax = y + halfHeight;
		}
		/* Checks to see if this collider is overlapping with another collider. */
		public function checkOverlap(other:Collider):Boolean {
			if(this.xMax < other.xMin)return false;
			if(this.xMin > other.xMax)return false;
			
			if(this.yMax < other.yMin)return false;
			if(this.yMin > other.yMax)return false;
			return true;
		}

	}
	
}
