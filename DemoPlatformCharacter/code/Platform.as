package code {
	import flash.display.MovieClip;
	
	public class Platform extends MovieClip{
		
		var platformCollider = new Collider(width / 2, height / 2);

		public function Platform() {
			platformCollider.calcCollide(x, y);

		}

	}
	
}
