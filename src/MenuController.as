package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Stage
	import flash.display.MovieClip;
	import flash.media.Sound;

	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class MenuController extends Sprite
	{
		private var startButton 	: 	StartButton	= new StartButton();
		private var menuBackground 	: 	MenuBG     	= new MenuBG();
		private var introScene		:	Fly_Into	= new Fly_Into();
		private var starting		:	Boolean		= false;
		private var menuMusic		:	MenuMusic	= new MenuMusic();
		
		public function MenuController() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			menuMusic.play(0,1);
			
			addChild(introScene);
			introScene.x = stage.stageWidth / 2;
			introScene.y = stage.stageHeight / 2;
			introScene.stop();
			
			//Starting "startMenu" function
			startMenu();
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function startMenu():void
		{
			//Adding and positioning startButton
			addChild(startButton);
			startButton.x = stage.stageWidth / 2 + 30;
			startButton.y = 100;
			
			var buttonHolder:MovieClip = new MovieClip();
			
			addChild(buttonHolder);
			buttonHolder.addChild(startButton);
			buttonHolder.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function update(e:Event):void 
		{
			if (starting && introScene.currentFrame >= introScene.totalFrames - 1)
			{
				introScene.stop();
				dispatchEvent(new Event("startgame"));
			}
		}
		
		private function click(e:MouseEvent):void
		{
			//Dispatching function if startbutton is clicked dispatch to "start" function in Main class
			if (e.target == startButton && !starting)
			{
				startButton.visible = false;
				introScene.play();
				starting = true;
			}
			
		}
		
		
	}

}