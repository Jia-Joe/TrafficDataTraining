package parcel4;

public class TestParcel {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Parcel4Plus p=new Parcel4Plus();
		Contents c=p.contents();
		Destination d=p.destination("TestParcel4");
		Parcel4Plus.PDestination pd=p.new PDestination("TestInnerclasses");
		
	}

}
