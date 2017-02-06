package com.sd.burger.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
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
	public Map<Integer, String> getAllIngredientTypes() {
		Map<Integer, String> ingredientTypes = new HashMap<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT id, type" + " FROM ingredient_type;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				ingredientTypes.put(rs.getInt(1), rs.getString(2));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ingredientTypes;
	}

	@Override
	public List<Ingredient> getIngredientsByType(int typeId) {
		List<Ingredient> ingredientsByType = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT i.id, i.name, i.description, it.type" 
					  + " FROM ingredient i JOIN ingredient_type it ON i.ingredient_type_id = it.id"
					  + " WHERE ingredient_type_id = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, typeId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Ingredient i = new Ingredient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				ingredientsByType.add(i);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ingredientsByType;
	}

	@Override
	public List<BurgerInfo> getAllBurgerInfo() {
		List<BurgerInfo> burgerInfo = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT id, name, description " + " FROM burger;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				BurgerInfo bi = new BurgerInfo(rs.getInt(1), rs.getString(2), rs.getString(3));
				burgerInfo.add(bi);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return burgerInfo;
	}

	@Override
	public Burger getBurgerById(int id) {
		Burger burger = null;

		String sql = "SELECT b.id, b.name, b.description," 
						+ " i.id, i.name, i.description,"
						+ " it.type, bi.position" 
				+ " FROM burger_ingredient bi"
					+ " JOIN ingredient i ON bi.ingredient_id = i.id"
					+ " JOIN ingredient_type it ON it.id = i.ingredient_type_id"
					+ " JOIN burger b ON b.id = bi.burger_id" 
				+ " WHERE b.id = ?" 
				+ " ORDER BY bi.position";

		try (Connection conn = DriverManager.getConnection(url, user, pass);
				PreparedStatement stmt = conn.prepareStatement(sql);) {

			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			List<Ingredient> ingredients = new ArrayList<>();
			while (rs.next()) {
				// id | name | description | id | name | description | type |
				// position

				if (burger == null) {
					int bid = rs.getInt(1);
					String bname = rs.getString(2);
					String bdesc = rs.getString(3);
					// String bdate = rs.getString(4);

					burger = new Burger();
					burger.setId(bid);
					burger.setName(bname);
					burger.setDescription(bdesc);
					// burger.setDate(LocalDate.parse(bdate));
				}

				int ingId = rs.getInt(4);
				String ingName = rs.getString(5);
				String ingDesc = rs.getString(6);
				String ingType = rs.getString(7);
				int ingPos = rs.getInt(8);

				ingredients.add(ingPos - 1, new Ingredient(ingId, ingName, ingDesc, ingType));
			}

			if (burger != null)
				burger.setIngredients(ingredients);

		} catch (SQLException e) {
			System.err.println(e.getErrorCode() + " : " + e.getMessage());
			e.printStackTrace();
		}

		return burger;
	}

	@Override
	public boolean createBurger(Burger burger) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			if (burger != null) {
				conn = DriverManager.getConnection(url, user, pass);
				conn.setAutoCommit(false);
				
				StringBuilder sb = new StringBuilder();
				sb.append("INSERT INTO burger (name, description) ");
				sb.append("VALUES (?, ?);");
				String sql = sb.toString();

				stmt = conn.prepareStatement(sql);
				stmt.setString(1, burger.getName());
				stmt.setString(2, burger.getDescription());
				int result = stmt.executeUpdate();
				stmt.close();

				
				// retrieve and set id of new burger
				stmt = conn.prepareStatement("SELECT last_insert_id()");
				ResultSet rs = stmt.executeQuery();
				rs.next();
				burger.setId(rs.getInt(1));
				
				List<Ingredient> ingredients = burger.getIngredients();
				
				if (result > 0) {
					for (int i = 0; i < ingredients.size(); i++) {
						sb = new StringBuilder();
						sb.append("INSERT INTO burger_ingredient (burger_id, ingredient_id, position) ");
						sb.append("VALUES (?, ?, ?);");

						sql = null;
						sql = sb.toString();

						stmt = null;
						stmt = conn.prepareStatement(sql);
						stmt.setInt(1, burger.getId());
						stmt.setInt(2, ingredients.get(i).getId());
						stmt.setInt(3, (i + 1));
						result = stmt.executeUpdate();
					}
					if (result > 0) {
						conn.commit();
						return true;
					}
				}
				
			}
		} 
		catch (SQLException e) {
			try { conn.rollback(); } 
			catch (SQLException e1) { }
			
			e.printStackTrace();
		}
		finally {
			try {
				stmt.close();
				conn.close();
			} 
			catch (Exception e) { }
		}

		try { conn.rollback(); } 
		catch (SQLException e1) { }
		
		return false;
	}

	@Override
	public boolean updateBurger(Burger burger) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			if (burger != null) {
				conn = DriverManager.getConnection(url, user, pass);
				conn.setAutoCommit(false);
				
				StringBuilder sb = new StringBuilder();
				String sql = "UPDATE burger " + "SET name = ?, description = ? WHERE id = ?;";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, burger.getName());
				stmt.setString(2, burger.getDescription());
				stmt.setInt(3, burger.getId());

				int result = stmt.executeUpdate();

				List<Ingredient> ingredients = burger.getIngredients();

				if (result > 0) {
					sql = "DELETE FROM burger_ingredient WHERE burger_id = ?;";
					stmt.close(); stmt = null;
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, burger.getId());
					result = stmt.executeUpdate();
					if (result > 0) {
						for (int i = 0; i < ingredients.size(); i++) {
							sb = new StringBuilder();
							sb.append("INSERT INTO burger_ingredient (burger_id, ingredient_id, position) ");
							sb.append("VALUES (?, ?, ?);");

							sql = null;
							sql = sb.toString();

							stmt = null;
							stmt = conn.prepareStatement(sql);
							stmt.setInt(1, burger.getId());
							stmt.setInt(2, ingredients.get(i).getId());
							stmt.setInt(3, (i + 1));
							result = stmt.executeUpdate();
						}
						if (result > 0) {
							conn.commit();
							return true;
						}
					}
				}
			}
		} 
		catch (SQLException e) {
			try { conn.rollback(); } 
			catch (SQLException e1) { }
			
			e.printStackTrace();
		}
		finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) { }
		}
		
		try { conn.rollback(); } 
		catch (SQLException e1) { }

		return false;
	}

	@Override
	public boolean destroyBurgerById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false);

			String sql = "DELETE FROM burger_ingredient WHERE burger_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			int result = stmt.executeUpdate();
			if (result > 0) {
				sql = "DELETE FROM burger WHERE id = ?";
				stmt.close(); stmt = null;
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				result = stmt.executeUpdate();
				if (result > 0) {
					conn.commit();
					return true;
				}
			}
		} 
		catch (SQLException e) {
			try { conn.rollback(); } 
			catch (SQLException e1) { }

			e.printStackTrace();
		}
		finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) { }
		}
		
		try { conn.rollback(); } 
		catch (SQLException e1) { }
		return false;
	}

}
