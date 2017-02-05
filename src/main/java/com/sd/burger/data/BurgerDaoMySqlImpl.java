package com.sd.burger.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BurgerDaoMySqlImpl implements BurgerDAO {

	private static String url = "jdbc:mysql://localhost:3306/burgerdb";
	String user = "burgerchef";
	String pass = "burgerchef";

	public BurgerDaoMySqlImpl() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("Error loading MySQL driver");
		}
	}

	@Override
	public List<BurgerInfo> getAllBurgerInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Burger getBurgerById(int id) {
		Burger burger = null;
		
		String sql = 
			"SELECT b.id, b.name, b.description, " +
			"       i.id, i.name, i.description, " +
			"       it.type, bi.position"          +
			"FROM burger_ingredient bi" +
			"     JOIN ingredient i ON bi.ingredient_id = i.id" +
			"     JOIN ingredient_type it ON it.id = i.ingredient_type_id" +
			"     JOIN burger b ON b.id = bi.burger_id" +
			"WHERE b.id = ?" +
			"ORDER BY bi.position";

		try( Connection conn = DriverManager.getConnection(url, user, pass);
			 PreparedStatement stmt = conn.prepareStatement(sql); ) {
	
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			
			List<Ingredient> ingredients = new ArrayList<>();
			while(rs.next()) {
				//id | name | description | id | name | description | type | position
				
				if(burger == null) {
					int    bid   = rs.getInt(1);
					String bname = rs.getString(2);
					String bdesc = rs.getString(3);
					// String bdate = rs.getString(4);
					
					burger = new Burger();
					burger.setId(bid);
					burger.setName(bname);
					burger.setDescription(bdesc);
					// burger.setDate(LocalDate.parse(bdate));
				}
				
				int    ingId   = rs.getInt(4);
				String ingName = rs.getString(5);
				String ingDesc = rs.getString(6);
				String ingType = rs.getString(7);
				int    ingPos  = rs.getInt(8);
				
				ingredients.add(ingPos-1, new Ingredient(ingId, ingName, ingDesc, ingType));
			}
			
			if(burger != null)
				burger.setIngredients(ingredients);

		}
		catch(SQLException e) {
			System.err.println(e.getErrorCode() + " : " + e.getMessage());
		}
		
		return burger;
	}

	@Override
	public boolean createBurger(Burger burger) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBurger(Burger burger) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean destroyBurgerById(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
