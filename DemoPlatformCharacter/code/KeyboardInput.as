package code {
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	/**
	 * This is the class for keyboard input.
	 */
	
	public class KeyboardInput {

		//Variables for whether a key is pushed or not.
		static public var keyA:Boolean = false;
		static public var keyW:Boolean = false;
		static public var keyD:Boolean = false;
		static public var keyS:Boolean = false;
		static public var keyEnter:Boolean = false;
		static public var keySpace:Boolean = false;
		
		//Event listeners for when a key is pushed down or lifted
		static public function setup(stage:Stage) {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handlekeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handlekeyUp);
		}
		//updateKey function, updates the status of individual keys
		static private function updateKey(keyCode:int, isDown:Boolean):void {

			if(keyCode == 13) keyEnter = isDown;
			if(keyCode == 65) keyA = isDown;
			if(keyCode == 87) keyW = isDown;
			if(keyCode == 68) keyD = isDown;
			if(keyCode == 83) keyS = isDown;
			if(keyCode == 32) keySpace = isDown;

		}
		//If a key is pushed, set that key's isDown status to true
		static private function handlekeyDown(e:KeyboardEvent):void {
			//trace(e.keyCode);
			updateKey(e.keyCode, true);
		}
		//If a key is lifted, set that key's isDown status to false
		static private function handlekeyUp(e:KeyboardEvent):void {
			
			updateKey(e.keyCode, false);
		}
		

	}
	
}
