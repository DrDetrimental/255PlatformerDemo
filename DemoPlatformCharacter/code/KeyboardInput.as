package code {
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	/**
	 * This is the class for keyboard input.
	 */
	
	public class KeyboardInput {
		
		static public var keysState:Array = new Array();
		static public var keysPrevState:Array = new Array();
		
		//Event listeners for when a key is pushed down or lifted
		static public function setup(stage:Stage) {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handlekeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handlekeyUp);
		}
		/**
		 * This function's job is to cache all the key values, for the next frame
		 */
		static public function update():void{
			keysPrevState = keysState.slice();
		}
		//updateKey function, updates the status of individual keys
		static private function updateKey(keyCode:int, isDown:Boolean):void {

			/*
			if(keyCode == 13) keyEnter = isDown;
			if(keyCode == 65) keyA = isDown;
			if(keyCode == 87) keyW = isDown;
			if(keyCode == 68) keyD = isDown;
			if(keyCode == 83) keyS = isDown;
			if(keyCode == 32) keySpace = isDown;
			*/
			keysState[keyCode] = isDown;

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
		static public function IsKeyDown(keyCode:int):Boolean{
			if(keyCode < 0){
				return false;
			}
			if(keyCode >= keysState.length){
				return false;
			}
			return keysState[keyCode];
		}
		static public function OnKeyDown(keyCode:int):Boolean{
			if(keyCode < 0){
				return false;
			}
			if(keyCode >= keysState.length){
				return false;
			}
			//return(keysState[keyCode] && !keysPrevState[keyCode]);
			if(keysState[keyCode] == false) return false;
			if(keysPrevState[keyCode] == true) return false;
			return true;
		}

	}
	
}
