package  
{
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Player2 extends PaddleController 
	{
		public function Player2():void
		{
			setColor(2);
		}
		
		override protected function aimPlate(e:KeyboardEvent):void 
		{
			if (e.keyCode == 65)
			{
				dir = -1;
			}
				
			if (e.keyCode == 68)
			{
				dir = 1;
			}
		}
			
		override protected function stopAimPlate(e:KeyboardEvent):void 
		{
			if (e.keyCode == 65 || e.keyCode == 68)
			{
				dir = 0;
			}
		}
	}
}