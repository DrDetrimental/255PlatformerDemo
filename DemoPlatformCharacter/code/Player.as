package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/* This is the class for the player. */
	
	public class Player extends MovieClip {
		/* variable holding the values for x/y gravity */
		private var gravity:Point = new Point(0, 400);
		/* variable holding the velocity values for the player */
		private var velocity:Point = new Point(0, 0);
		/* variable declaring the player's maximum speed */
		private var maxSpeed:Number = 300;
		/* constant storing the player's horizontal deceleration */
		private const HORIZONTAL_ACCELERATION:Number = 800;
		/* constant storing the player's horizontal acceleration */
		private const HORIZONTAL_DECELERATION:Number = 800;
		
		/* Constructor code for the player */
		public function Player() {
			// constructor code
		}
		
		/* Update function for the player */
		public function update():void{
			trace(KeyboardInput.OnKeyDown(Keyboard.LEFT));
			
			handleJumping();
			
			handleWalking();
			
			doPhysics();
			
			detectGround();
		}
		/* function handling ground detection */
		private function detectGround():void{
			//look at y position
			var ground:Number = 350;
			if (y > ground){
				y = ground; //clamp position
				velocity.y = 0; //clamp velocity
			}
		}
		/* function handling physics */
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
		/* function handling horizontal movement */
		private function handleWalking():void{
			//accelerate in the direction of the arrow key pressed
			if(KeyboardInput.IsKeyDown(Keyboard.LEFT)) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if(KeyboardInput.IsKeyDown(Keyboard.RIGHT)) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;
			//decelerate if no keys are pressed
			if(!KeyboardInput.IsKeyDown(Keyboard.LEFT) && !KeyboardInput.IsKeyDown(Keyboard.RIGHT)){
				if(velocity.x < 0){
					velocity.x += HORIZONTAL_DECELERATION * Time.dt;
					if(velocity.x > 0) velocity.x = 0; //clamp <- velocity
				}
				if(velocity.x > 0){
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt;
					if(velocity.x < 0) velocity.x = 0; //clamp -> velocity
				}
			}
		}
		/* function handling jumping */
		private function handleJumping():void {
			
			/** TO DO:
			 * Press space -> Jump.
			 * Hold space -> Jump higher.
			 * Press space midair -> double jump.
			 */

			if(KeyboardInput.OnKeyDown(Keyboard.SPACE)){
				//jump from ground
				velocity.y = -200;
				trace("jump");
			}
		}
	}
}
