package models;

public class Star {
	private float star_average;
	private float star_temporary;
	private int count;
	
	public Star() {
		super();
	}

	public Star(float star_average) {
		super();
		this.star_average = star_average;
	}

	public Star(float star_average, float star_temporary, int count) {
		super();
		this.star_average = star_average;
		this.star_temporary = star_temporary;
		this.count = count;
	}

	public Star(float star_temporary, int count) {
		super();
		this.star_temporary = star_temporary;
		this.count = count;
	}
	public float getstar_average() {
		return star_average;
	}
	public void setstar_average(float star_average) {
		this.star_average = star_average;
	}

	public float getstar_temporary() {
		return star_temporary;
	}

	public void setstar_temporary(float star_temporary) {
		this.star_temporary = star_temporary;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
