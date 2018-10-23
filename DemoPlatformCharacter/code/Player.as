package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class Player extends MovieClip {
		
		//private var velocityX:Number = 0;
		//private var velocityY:Number = 0;
		
		private var gravity:Point = new Point(0, 100);
		private var velocity:Point = new Point(1, 5);
		private var maxSpeed:Number = 300;
		private const HORIZONTAL_ACCELERATION:Number = 800;
		private const HORIZONTAL_DECELERATION:Number = 800;
		
		public function Player() {
			// constructor code
		}
		
		public function update():void{
			
			if(KeyboardInput.keyA) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if(KeyboardInput.keyD) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;
			
			if(!KeyboardInput.keyA && !KeyboardInput.keyD){
				if(velocity.x < 0){
					velocity.x += HORIZONTAL_DECELERATION * Time.dt;
					if(velocity.x > 0) velocity.x = 0;
				}
				if(velocity.x > 0){
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt;
					if(velocity.x < 0) velocity.x = 0;
				}
			}
			
			doPhysics();
			
			detectGround();
		}
		private function detectGround():void{
			//look at y position
			var ground:Number = 350;
			if (y > ground){
				y = ground; //clamp
				velocity.y = 0;
			}
		}
		private function doPhysics():void{
			//apply gravity to velocity
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;
			
			//constrain to maxSpeed
			if(velocity.x > maxSpeed) velocity.x = maxSpeed;
			if(velocity.x < -maxSpeed) velocity.x = -maxSpeed;
			
			//apply velocity to position
			x += velocity.x * Time.dt;
			y += velocity.y * Time.dt;
		}
	}
}
