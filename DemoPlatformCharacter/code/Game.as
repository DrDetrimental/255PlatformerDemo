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
		}//ends gameLoop
	}//ends game class
}//ends package
