package interfaces.classprocessor;

public interface Processor {
	String name();
	Object process(Object input);
}