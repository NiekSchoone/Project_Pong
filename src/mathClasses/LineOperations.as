package mathClasses
{
	//import Assets.PointClass;
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class LineOperations 
	{
		public static function constructionWithTwoPoints(P:PointClass, Q:PointClass, l:Line)
		{
			l.a = (Q.y - P.y);
			l.b = Q.x - P.x;
			l.c = l.a * P.x + l.b * P.y;
		}
		public static function snijpunt(l:Line, m:Line, S:PointClass):void 
        {
            var result:Array = new Array()
            S.x = (m.b * l.c - l.b * m.c) / (l.a * m.b - m.a * l.b);
            S.y = (m.c * l.a - l.c * m.a) / (l.a * m.b - m.a * l.b);
        }
	}

}