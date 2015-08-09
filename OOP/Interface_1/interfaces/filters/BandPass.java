package interfaces.filters;

public class BandPass {
	double lowCutoff,highCutoff;

	public BandPass(double lowCutoff, double highCutoff) {
		this.lowCutoff = lowCutoff;
		this.highCutoff = highCutoff;
	}
	public Waveform process(Waveform input) {
		return input;
	}
}
