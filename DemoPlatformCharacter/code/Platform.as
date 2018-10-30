package code {
	import flash.display.MovieClip;
	
	public class Platform extends MovieClip{

		public function Platform() {
			platformCollider = new Collider(width/2, height/2);
			platformCollider.calcCollide(x, y);
		}

	}
	
}
