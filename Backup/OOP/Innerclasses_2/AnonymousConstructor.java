abstract class Base {
	public Base (int i) {
		System.out.println("Base Constructor"+i);
	}
	public abstract void f();
	
}
public class AnonymousConstructor {
	public static Base getBase(int i) {
		return new Base(i) {
			{System.out.println("Inside instance");}
			public void f() {
				System.out.println("Anonymous f()");
			}
		};
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Base base=getBase(12);
		base.f();
	}

}
