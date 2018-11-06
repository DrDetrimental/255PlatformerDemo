package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Game extends MovieClip {
		
		
		public function Game() {
			KeyboardInput.setup(stage);
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}//ends game constructor
		
		public function gameLoop(e:Event):void{
			player.update();
			Time.update();
			collisionDetection();
			KeyboardInput.update();
		}//ends gameLoop
		private function collisionDetection():void {
			if(player.playerCollider.checkOverlap(platform.platformCollider)){
				if(player.playerCollider.yMax > platform.platformCollider.yMin){
					player.y = platform.platformCollider.yMin - player.height / 2;
					player.velocity.y = 0; //clamp velocity
					player.playerState = 0;
					
				}
			} else {
				platform.alpha = 1;
			}
		}
	}//ends game class
}//ends package
