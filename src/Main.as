package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Main extends Sprite 
	{
		private var game  			: 	GameController	= 	new GameController();
		private var menu  			: 	MenuController 	= 	new MenuController();
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			addChild(menu);
			menu.addEventListener("startgame", start);
		}
		
		private function start(e:Event):void
		{
			menu.visible = false;
			addChild(game);
		}
		
	}
	
}