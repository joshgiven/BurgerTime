package com.sd.burger.data;

public class Ingredient {
	private int id;
	private String name;
	private String description;
	private String ingredientType;
	
	public Ingredient() { }
	
	public Ingredient(int id, String name, String description, String ingredientType) {
		super();
		this.setId(id);
		this.name = name;
		this.description = description;
		this.ingredientType = ingredientType;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIngredientType() {
		return ingredientType;
	}
	public void setIngredientType(String ingredientType) {
		this.ingredientType = ingredientType;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Ingredient [name=");
		builder.append(name);
		builder.append(", description=");
		builder.append(description);
		builder.append(", ingredientType=");
		builder.append(ingredientType);
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
