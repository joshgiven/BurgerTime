package com.sd.burger.data;

import java.util.List;
import java.util.Map;

public interface BurgerDAO {
	// Read
	List<BurgerInfo> getAllBurgerInfo();
	
	Burger getBurgerById(int id);
	
	Map<Integer, String> getAllIngredientTypes();
	
	List<Ingredient> getIngredientsByType(int id);
	
	// Create
	boolean createBurger(Burger burger);
	
	// Update
	boolean updateBurger(Burger burger);
	
	// Destroy
	boolean destroyBurgerById(int id);
	
	
	public static class BurgerInfo {
		private int id;
		private String name;
		private String description;
		
		public BurgerInfo() { }
		
		public BurgerInfo(int id, String name, String description) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
		}
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
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

		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("BurgerInfo [id=");
			builder.append(id);
			builder.append(", name=");
			builder.append(name);
			builder.append(", description=");
			builder.append(description);
			builder.append("]");
			return builder.toString();
		}
		
	}

}
