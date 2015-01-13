package  
{
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Player1 extends PaddleController 
	{
		public function Player1():void
		{
			setColor(1);
		}
		
		override protected function aimPlate(e:KeyboardEvent):void 
		{
			if (e.keyCode == 37)
			{
				dir = -1;
			}
				
			if (e.keyCode == 39)
			{
				dir = 1;
			}
		}
			
		override protected function stopAimPlate(e:KeyboardEvent):void 
		{
			if (e.keyCode == 37 || e.keyCode == 39)
			{
				dir = 0;
			}
		}	
	}
}