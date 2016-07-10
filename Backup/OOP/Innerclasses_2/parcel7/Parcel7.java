package parcel7;

import parcel4.Contents;

public class Parcel7 {
	public Contents contents() {
		return new Contents() {
			private int i=11;
			public int value(){return i;}
		};
	}////////////////////////////////////
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Parcel7 p=new Parcel7();
		Contents c=p.contents();
	}

}

/*
public class Parcel7b {
	class MyContents implements Contents {
		private int i=11;
		public int value(){return i;}
	}
	public Contents contents() {
		return new MyContents();
	}
	public static void main(String[] args) {
		Parcel7b p=new Parcel7b();
		Contents c=p.contents();
	}
}
*/