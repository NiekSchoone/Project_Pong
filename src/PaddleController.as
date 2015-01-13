package  
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class PaddleController extends Sprite
	{
		public 	var playerHolder 	: PlayerArt = new PlayerArt();
		
		private var orbitPoint		: Point = new Point();
		
		public 	var angle	: 	Number 	= 	0;
		private var speed	: 	Number 	=	8;
		private var radius	: 	Number 	= 	190;
		
		protected var dir	: 	int		=   0;
		
		public var color : int;
		
		public function PaddleController():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(playerHolder);
			
			orbitPoint.x = stage.stageWidth / 2;
			orbitPoint.y = stage.stageHeight / 2;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, aimPlate);
			stage.addEventListener(KeyboardEvent.KEY_UP, stopAimPlate);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function setColor(_color : int):void
		{
			color = _color;
			playerHolder.gotoAndStop(_color);
		}
		
		protected function aimPlate(e:KeyboardEvent):void 
		{
			
		}
		
		protected function stopAimPlate(e:KeyboardEvent):void 
		{
			
		}
		
		private function update(e:Event):void 
		{
			var rad : Number = angle * (Math.PI / 180);
			
			playerHolder.x = orbitPoint.x + radius * Math.cos(rad);
			playerHolder.y = orbitPoint.y + radius * Math.sin(rad);
			
			playerHolder.rotation = (Math.atan2(playerHolder.y - orbitPoint.y, playerHolder.x - orbitPoint.x) * 180 / Math.PI);
			
			angle += dir * speed;
			
		}
	}
}