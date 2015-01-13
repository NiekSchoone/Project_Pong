package mathClasses
{
	/**
	 * ...
	 * @author Niek Schoone
	 */
	public class Line 
	{
		public var a:Number;
		public var b:Number
		public var c:Number
		
		public function Line(a:Number, b:Number, c:Number) 
		{
			this.a = a;
			this.b = b;
			this.c = c;
			
			
		}
		
		public function calculateY(x_in:Number):Number
		{
			return (this.c - this.a * x_in) / this.b;
		}
		
		public function calculateX(y_in:Number):Number
		{
			return(this.c - this.b * y_in) / this.a;
		}
		
	}

}