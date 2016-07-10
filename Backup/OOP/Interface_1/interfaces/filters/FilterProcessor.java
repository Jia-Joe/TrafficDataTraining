package interfaces.filters;

import interfaces.classprocessor.Apply;
import interfaces.classprocessor.Processor;
//适配器
class FilterAdapter implements Processor  {
	Filter filter;//用作代理
	public FilterAdapter(Filter filter) {
		this.filter = filter;
	}

	@Override
	public String name() {
		// TODO Auto-generated method stub
		return filter.name();
	}
	@Override
	//协变返回类型
	public Waveform process(Object input) {
		// TODO Auto-generated method stub
		return filter.process((Waveform)input);
	}
}
public class FilterProcessor {
	public static void main(String[] args) {
		Waveform w1=new Waveform();
		Waveform w2=new Waveform();
		Waveform w3=new Waveform();
		Apply.process(new FilterAdapter(new LowPass(1.0)), w1);
		Apply.process(new FilterAdapter(new LowPass(2.0)), w2);
		Apply.process(new FilterAdapter(new BandPass(3.0,4.0)), w3);
	}
}
