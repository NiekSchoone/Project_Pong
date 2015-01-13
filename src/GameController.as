package  
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import mathClasses.Line;
	import mathClasses.LineOperations;
	import mathClasses.PointClass;
	import mathClasses.Vector2D;
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class GameController extends Sprite 
	{
		private var playerPaddle: 	Player1		 	= 	new Player1();
		private var enemyPaddle	:	Player2			= 	new Player2();
		
		private var ball    	: 	BallController 	= 	new BallController();
		
		private var playerGoal	:	Goal1			= 	new Goal1();
		private var enemyGoal	:	Goal2			= 	new Goal2();
		
		private var backGround 	:	TopViewBG		=	new TopViewBG();
		
		private var playerWin	:	Boolean			= 	true;
		
		private var l			:	Line			= 	new Line(0, 0, 0);
		private var m			:	Line			= 	new Line(0, 0, 0);
		private var p 			:	PointClass		= 	new PointClass(0xff0000, 5, false);
		
		private var line		: 	Sprite			=	new Sprite();
		
		private var dist		:	Vector2D		=	new Vector2D(100, 100);
		private var dist2 		:	Vector2D		= 	new Vector2D(0, 0);
		
		public var paddleNormal 	: 	Vector2D 	= 	new Vector2D(0,0);
		public var paddleParallel 	: 	Vector2D 	= 	new Vector2D(0,0);
		
		private var backgroundMusic	:	GameMusic	=	new	GameMusic();
		
		private var hasBeenHit		:	Boolean		= 	false;
		
		public function GameController():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			backgroundMusic.play(0, 0);
			
			backGround.x = stage.stageWidth / 2;
			backGround.y = stage.stageHeight / 2;
			
			addChild(backGround);
			backGround.play();
			
			addChild(playerPaddle);
			
			addChild(enemyPaddle);
			enemyPaddle.angle = 180;
			
			addChild(playerGoal);
			
			addChild(enemyGoal);
			enemyGoal.angle = 180;
			
			addChild(ball);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		
		private function update(e:Event):void 
		{
			
			l.b = 1
			l.a = -Math.tan((playerPaddle.angle - 90) * Math.PI / 180);
			l.c = playerPaddle.playerHolder.x * l.a + playerPaddle.playerHolder.y * l.b;
			
			m.a = - l.b;
			m.b = l.a;
			m.c = m.a * ball.ballObject.x + m.b * ball.ballObject.y;
			
			line.graphics.clear();
			line.graphics.lineStyle(0, 0, 0);
			line.graphics.moveTo(0, l.calculateY(0));
			line.graphics.lineTo(800, l.calculateY(800));
			
			line.graphics.lineStyle(0, 0, 0);
			line.graphics.moveTo(0, m.calculateY(0));
			line.graphics.lineTo(800, m.calculateY(800));
			
			LineOperations.snijpunt(l, m, p);
			
			paddleNormal.x 	 = l.a;
			paddleNormal.y 	 = l.b;
			paddleParallel.x = -l.b;
			paddleParallel.y = l.a;
			
			paddleParallel.normalize();
			paddleNormal.normalize();
			
			paddleNormal.length 	= ball.velocity.dotProduct(paddleNormal);
			paddleParallel.length 	= ball.velocity.dotProduct(paddleParallel);
			
			dist.x 	= p.x - ball.ballObject.x;
			dist.y 	= p.y - ball.ballObject.y;
			
			dist2.x = p.x - playerPaddle.playerHolder.x;
			dist2.y = p.y - playerPaddle.playerHolder.y;
			
			if (hasBeenHit == false)
			{
				if (dist.length <= 20 && dist2.length < 33)
				{
					playerWin = true;
					
					hasBeenHit = true;
					
					paddleNormal.x 	= - paddleNormal.x;
					paddleNormal.y 	= - paddleNormal.y;
					ball.velocity.x = paddleNormal.x + paddleParallel.x;
					ball.velocity.y = paddleNormal.y + paddleParallel.y;
				}
			}
			
			if (dist.length > 30)
			{
				hasBeenHit = false;
			}
				
				
			if (ball.hitTestObject(playerGoal.goalHitBox))
			{
				if (playerWin == true)
				{
					trace("Hit And Won!")
				}
				else
				{
					trace("Hit and lose!")
				}
				
			}
			if (ball.hitTestObject(enemyGoal.goalHitBox))
			{
				trace("hit");
				
			}	
		}
	}
}