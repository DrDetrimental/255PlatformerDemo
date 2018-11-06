package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/* This is the class for the player. */
	
	public class Player extends MovieClip {
		/* variable holding the values for x/y gravity */
		private var gravity:Point = new Point(0, 400);
		/* variable holding the velocity values for the player */
		public var velocity:Point = new Point(0, 0);
		/* variable declaring the player's maximum speed */
		private var maxSpeed:Number = 300;
		/** variable storing the player's current state
		 * 0 = on ground
		 * 1 = in air, hasn't doublejumped
		 * 2 = in air, has doublejumped
		 */
		public var playerState:int = 1;
		/* constant storing the player's horizontal deceleration */
		private const HORIZONTAL_ACCELERATION:Number = 800;
		/* constant storing the player's horizontal acceleration */
		private const HORIZONTAL_DECELERATION:Number = 800;
		/* constant storing the player's jump speed */
		private const JUMP_SPEED:Number = -300
		
		var playerCollider = new Collider(width / 2, height / 2);
		
		/* Constructor code for the player */
		public function Player() {
			// constructor code
			
		}
		
		/* Update function for the player */
		public function update():void{
			
			handleJumping(); //Handles jumping
			
			handleWalking(); //Handles moving
			
			doPhysics(); //Updates player's position
			
			detectCollision(); //Detects any collisions
			
			playerCollider.calcCollide(x, y); //Calculates the position of the player's hitbox

		}
		/* function handling ground detection */
		private function detectCollision():void{
			/*look at y position */
			var ground:Number = 350;
			if (y > ground){
				y = ground; //clamp position
				velocity.y = 0; //clamp velocity
				playerState = 0;
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
			/*accelerate in the direction of the arrow key pressed */
			if(KeyboardInput.IsKeyDown(Keyboard.LEFT)) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if(KeyboardInput.IsKeyDown(Keyboard.RIGHT)) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;
			/* decelerate if no keys are pressed */
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
			//if space is pressed...
			if(KeyboardInput.OnKeyDown(Keyboard.SPACE)){
				if(playerState == 0){
					//jump from ground
					velocity.y = JUMP_SPEED;
					//trace("jump");
					playerState = 1;
				} else if (playerState == 1) {
					//jump in midair
					velocity.y = JUMP_SPEED;
					//trace("double jump");
					playerState = 2;
				} else {
					//nothing
					//trace("already double jumped");
				}
			}
			//if holding space...
			if(KeyboardInput.IsKeyDown(Keyboard.SPACE)){
				//...while player is going up:
				if(velocity.y < 0){
					//reduce gravity
					gravity.y = 200;
				} else {
					//gravity is normal
					gravity.y = 400;
				}
			} else {
				//gravity is normal
				gravity.y = 400;
			}
		}
	}
}
