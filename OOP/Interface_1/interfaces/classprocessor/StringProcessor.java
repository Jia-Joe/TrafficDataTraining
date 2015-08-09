package interfaces.classprocessor;
import java.util.*;

public abstract class StringProcessor implements Processor{

	public String name() {
		return getClass().getSimpleName();
	}
	public abstract String process(Object input);
	
	public static String s ="Hello Java";
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Apply.process(new Upcase(),s);
		Apply.process(new Downcase(),s);
		Apply.process(new Splitter(),s);
	}

}

class Upcase extends StringProcessor {
	public String process(Object input) {
		return ((String)input).toUpperCase();
	}
}
class Downcase extends StringProcessor {
	public String process(Object input) {
		return ((String)input).toLowerCase();
	}
}
class Splitter extends StringProcessor {
	public String process(Object input) {
		return Arrays.toString(((String)input).split(" "));
	}
}
