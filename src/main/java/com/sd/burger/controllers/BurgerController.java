package com.sd.burger.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.sd.burger.data.Burger;
import com.sd.burger.data.BurgerDAO;
import com.sd.burger.data.BurgerDaoMySqlImpl;
import com.sd.burger.data.Ingredient;

public class BurgerController {
	public static void main(String[] args) {
		BurgerDAO dao = new BurgerDaoMySqlImpl();
//		List<Ingredient> ingredients = new ArrayList<>();
//		ingredients.add(new Ingredient(1, "Sesame Seed Bun", "", "bun"));
//		ingredients.add(new Ingredient(15, "American", "", "cheese"));
//		ingredients.add(new Ingredient(5, "All-Beef Patty", "", "protien"));
//		ingredients.add(new Ingredient(1, "Sesame Seed Bun", "", "bun"));
//		Burger burger = new Burger(2, "testburger", "testDescription", LocalDate.now(), ingredients);
//		System.out.println(dao.createBurger(burger));
		
//		System.out.println(dao.getAllBurgerInfo());

//				List<Ingredient> ingredients = new ArrayList<>();
//		ingredients.add(new Ingredient(1, "Sesame Seed Bun", "", "bun"));
//		ingredients.add(new Ingredient(15, "American", "", "cheese"));
//		ingredients.add(new Ingredient(5, "All-Beef Patty", "", "protien"));
//		ingredients.add(new Ingredient(15, "American", "", "cheese"));
//		ingredients.add(new Ingredient(5, "All-Beef Patty", "", "protien"));
//		ingredients.add(new Ingredient(1, "Sesame Seed Bun", "", "bun"));
//		Burger b = new Burger(2, "testburger", "updated", LocalDate.now(), ingredients);
//		dao.updateBurger(b);
		
//		System.out.println(dao.destroyBurgerById(2));
		
//		System.out.println(dao.getBurgerById(1));
		
//		System.out.println(dao.getAllIngredientTypes());
		
//		System.out.println(dao.getIngredientsByType(1));
//		System.out.println(dao.getIngredientsByType(2));
//		System.out.println(dao.getIngredientsByType(3));
//		System.out.println(dao.getIngredientsByType(4));
//		System.out.println(dao.getIngredientsByType(5));
//		System.out.println(dao.getIngredientsByType(6));
		
	}
}
