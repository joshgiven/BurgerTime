package com.sd.burger.data;

public class IngredientType {
	private int id;
	private String type;
	private String description;
	
	public IngredientType() { };
	
	public IngredientType(int id, String type, String description) {
		super();
		this.id = id;
		this.type = type;
		this.description = description;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("IngredientType [type=");
		builder.append(type);
		builder.append(", description=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
