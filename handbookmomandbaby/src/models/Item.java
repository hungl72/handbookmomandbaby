package models;

public class Item {
	private Product product;
	private int amount;
	private double money;
	public Item() {
		super();
	}
	public Item(Product product, int amount, double money) {
		super();
		this.product = product;
		this.amount = amount;
		this.money = money;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
}
