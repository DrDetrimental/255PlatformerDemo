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
				platform.alpha = .5;
			} else {
				platform.alpha = 1;
			}
		}
	}//ends game class
}//ends package
