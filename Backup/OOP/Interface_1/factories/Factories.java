package factories;

interface Service {
	void method1();
	void method2();
}
interface ServiceFactory {
	Service getService();
}


class Implementaton1 implements Service {
	public Implementaton1() {}
	public void method1() {
		System.out.println("I1 method1");
	}
	public void method2() {
		System.out.println("I1 method2");
	}
}
class Imp1Factory implements ServiceFactory {
	public Service getService() {
		return new Implementaton1();
	}
}


class Implementaton2 implements Service {
	private Implementaton2() {}
	public void method1() {
		System.out.println("I2 method1");
	}
	public void method2() {
		System.out.println("I2 method2");
	}
	//Use anonymous class
	public static ServiceFactory factory=new ServiceFactory() {
		@Override
		public Service getService() {
			return new Implementaton2();
		}
	};
}


public class Factories {
	public static void serviceConsumer(ServiceFactory fact) {
		Service s=fact.getService();
		s.method1();
		s.method2();
	}
	public static void main(String[] args) {
		serviceConsumer(new Imp1Factory());
		serviceConsumer(Implementaton2.factory);		
	}

}
