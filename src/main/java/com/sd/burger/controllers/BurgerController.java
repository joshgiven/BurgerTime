package com.sd.burger.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sd.burger.data.Burger;
import com.sd.burger.data.BurgerDAO;
import com.sd.burger.data.BurgerDAO.BurgerInfo;
import com.sd.burger.data.BurgerDaoMySqlImpl;

@Controller
public class BurgerController {
	
	@Autowired
	private BurgerDAO dao;
	
	@RequestMapping(value="listBurgers.do", method=RequestMethod.GET)
	public ModelAndView listBurgers() {
		ModelAndView mv = new ModelAndView("listBurgers");
		
		List<BurgerInfo> infos = dao.getAllBurgerInfo();
		mv.addObject("burgerInfos", infos);
		
		return mv;
	}
	
	@RequestMapping(value="viewBurger.do", method=RequestMethod.GET)
	public ModelAndView viewBurger(int burgerId) {
		ModelAndView mv = new ModelAndView("burgerForm");
		
		Burger burger = dao.getBurgerById(burgerId);
		mv.addObject("burger", burger);
		
		return mv;
	}
	
	
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
