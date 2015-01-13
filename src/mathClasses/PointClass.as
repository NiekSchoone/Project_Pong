package mathClasses
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class PointClass extends Sprite 
	{
		
		public var color : uint;
		public var radius : Number;
		public var draggable : Boolean;
		
		public function PointClass(color:uint,radius:Number,draggable:Boolean = false):void 
		{
			this.draggable = draggable;
			var g : Graphics = this.graphics
			this.color = color;
			this.radius = radius;
			
			g.beginFill(color);
			g.drawCircle(0, 0, radius);
			g.endFill();
			
			if (draggable)
			{
				this.buttonMode = true;
				this.addEventListener(MouseEvent.MOUSE_DOWN, Drag);
				this.addEventListener(MouseEvent.MOUSE_UP, StopDrag);
			}
		}
		
		private function StopDrag(e:MouseEvent):void
		{
			this.stopDrag();
		}
		
		private function Drag(e:MouseEvent):void
		{
			this.startDrag();
		}
		
	}
	
}