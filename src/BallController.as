package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import flash.display.Stage;
	import mathClasses.Vector2D;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class BallController extends Sprite
	{
		public var ballObject 		: 	BallArt;
		
		private var radius 			: 	Number 	= 225;
		private var centrePoint 	: 	Vector2D;
		
		public var dotProduct		:	Number 	= 	0;
		
		private var position		:	Vector2D;
		public var velocity			:	Vector2D = new Vector2D(-4, -4);

		
		public function BallController()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			centrePoint = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			
			ballObject = new BallArt();
			addChild(ballObject);
			ballObject.scaleX = 0.4;
			ballObject.scaleY = 0.4;
			ballObject.y = stage.stageHeight / 2;
			ballObject.x = stage.stageWidth / 2;
			
			position = new Vector2D(ballObject.x, ballObject.y);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			
			ballObject.x = position.x;
			ballObject.y = position.y;
			
			position = position.add(velocity);
			
			var distance : Number = position.distance(centrePoint);
			
			if (distance >= radius)
			{
				velocity.x *= -1;
				velocity.y *= -1;
			}
			
			
		}
	}
}