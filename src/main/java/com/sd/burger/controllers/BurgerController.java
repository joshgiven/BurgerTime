package com.sd.burger.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sd.burger.data.Burger;
import com.sd.burger.data.BurgerDAO;
import com.sd.burger.data.BurgerDAO.BurgerInfo;
import com.sd.burger.data.Ingredient;

@Controller
@SessionAttributes({"ingredientLists"})
public class BurgerController {
	
	@Autowired
	private BurgerDAO dao;
	
	@ModelAttribute("ingredientLists")
	Map<String, List<Ingredient> > generateIngredientMap() {
		Map<Integer, String> types = dao.getAllIngredientTypes();
		
		Map<String, List<Ingredient> > iLists = new HashMap<>();
		for(int id : types.keySet()) {
			String type = types.get(new Integer(id));
			iLists.put(type, dao.getIngredientsByType(id));
		}
		
		return iLists;
	}
	
	@RequestMapping(value="listBurgers.do", method=RequestMethod.GET)
	public ModelAndView listBurgers() {
		ModelAndView mv = new ModelAndView();
		
		List<BurgerInfo> infos = dao.getAllBurgerInfo();
		if(infos != null) {
			mv.addObject("burgerInfos", infos);
			mv.setViewName("listBurgers");
		}
		else {
			mv.addObject("errorText", "Burgerbase lookup failed");
			mv.setViewName("error");
		}
		
		return mv;
	}
	
	@RequestMapping(value="destroyBurger.do", method=RequestMethod.GET)
	public ModelAndView destroyBurger(int burgerId) {
		ModelAndView mv = new ModelAndView();
		
		if(dao.destroyBurgerById(burgerId)) {
			List<BurgerInfo> infos = dao.getAllBurgerInfo();
			mv.addObject("burgerInfos", infos);
			mv.setViewName("listBurgers");
		}
		else {
			mv.addObject("errorText", "Failed to destroy burger");
			mv.setViewName("error");
		}
		
		return mv;
	}

	@RequestMapping(value="burgerCreateForm.do", method=RequestMethod.GET)
	public ModelAndView burgerCreateForm() {
		ModelAndView mv = new ModelAndView("burgerForm");
		return mv;
	}
	
	@RequestMapping(value="viewBurger.do", method=RequestMethod.GET)
	public ModelAndView viewBurger(int burgerId) {
		ModelAndView mv = new ModelAndView();
		
		Burger burger = dao.getBurgerById(burgerId);
		
		if(burger != null) {
			mv.addObject("burger", burger);
			mv.setViewName("burgerForm");
		}
		else {
			mv.addObject("errorText", "Burger lookup failed");
			mv.setViewName("error");
		}
		
		return mv;
	}
	
	@RequestMapping(value="createBurger.do", method=RequestMethod.POST)
	public ModelAndView createBurger(
			Burger burger
			, @RequestParam("ingredientId") ArrayList<Integer> ingredientId
			) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Ingredient> iList = new ArrayList<>();
		for(int id : ingredientId) {
			iList.add(new Ingredient(id, null, null, null));
		}
		
		burger.setIngredients(iList);
		
		if(dao.createBurger(burger)) {
			mv.addObject("burgerInfos", dao.getAllBurgerInfo());
			mv.setViewName("listBurgers");
		}
		else {
			mv.addObject("errorText", "Failed to create burger");
			mv.setViewName("error");
		}

		return mv;
	}
	
	@RequestMapping(value="updateBurger.do", method=RequestMethod.POST)
	public ModelAndView updateBurger(Burger burger,
			@RequestParam("ingredientId") ArrayList<Integer> ingredientId
			) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Ingredient> iList = new ArrayList<>();
		for(int id : ingredientId) {
			iList.add(new Ingredient(id, null, null, null));
		}
		
		burger.setIngredients(iList);
		
		if(dao.updateBurger(burger)) {
			mv.addObject("burgerInfos", dao.getAllBurgerInfo());
			mv.setViewName("listBurgers");
		}
		else {
			mv.addObject("errorText", "Failed to update burger");
			mv.setViewName("error");
		}
		
		return mv;
	}
}
