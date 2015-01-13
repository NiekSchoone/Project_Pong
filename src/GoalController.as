package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.display.Graphics
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class GoalController extends Sprite
	{
		
		private var goal : GoalArt = new GoalArt();
		
		public var goalHitBox : Sprite = new Sprite();
		
		private var orbitPoint   : Point = new Point();
		
		public var angle  	: 	Number 	= 	0;
		private var speed  	: 	Number 	=	0.1;
		private var radius	: 	Number 	= 	235;
		
		public var color	:	int;
		
		public function GoalController():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(goal);
			
			orbitPoint.x = stage.stageWidth / 2;
			orbitPoint.y = stage.stageHeight / 2;
			
			goalHitBox.graphics.beginFill(0,0);
			goalHitBox.graphics.lineStyle(0,0,0);
			goalHitBox.graphics.drawRect(-20,-38,40,75);
			goalHitBox.graphics.endFill();
			
			addChild(goalHitBox);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function setColor(_color : int):void
		{
			color = _color;
			goal.gotoAndStop(_color);
		}
		
		private function update(e:Event):void 
		{
			var rad : Number = angle * (Math.PI / 180);
			
			goal.x = orbitPoint.x + radius * Math.cos(rad);
			goal.y = orbitPoint.y + radius * Math.sin(rad);
			goalHitBox.x = orbitPoint.x + radius * Math.cos(rad);
			goalHitBox.y = orbitPoint.y + radius * Math.sin(rad);
			
			goal.rotation = (Math.atan2(goal.y - orbitPoint.y, goal.x - orbitPoint.x) * 180 / Math.PI);
			goalHitBox.rotation = (Math.atan2(goalHitBox.y - orbitPoint.y, goalHitBox.x - orbitPoint.x) * 180 / Math.PI);
			
			angle += 1 * speed;
		}
		
	}

}