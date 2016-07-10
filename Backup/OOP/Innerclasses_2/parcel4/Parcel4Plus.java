package parcel4;

public class Parcel4Plus {
	private class PContents implements Contents {
		private int i=11;
		public int value(){return i;}
	}
	protected class PDestination implements Destination {
		private String label;

		@Override
		public String readLabel() {
			// TODO Auto-generated method stub
			return label;
		}
		protected PDestination(String whereTo) {
			label=whereTo;
		}
	}
	public Destination destination(String s) {
		return new PDestination(s); 
	}
	public Contents contents()  {
		return new PContents(); 
	}
}
