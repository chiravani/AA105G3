package com.recipe.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class RecipeJDBCDAO implements RecipeDAO_interface
{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "foodtime";
	String psw = "foodtime";

	private static final String INSERT_STMT = 
			"INSERT INTO  recipe (recipe_no,mem_no,recipe_name,recipe_intro,food_mater) "
			+ "VALUES ('R'||lpad(recipe_seq.NEXTVAL,8,0),?,?,?,?)";
	private static final String Get_ALL_STMT = 
			"select recipe_no,mem_no,recipe_name,recipe_intro,food_mater,recipe_like,recipe_total_views"
			+ ",recipe_week_views,recipe_time from recipe order by recipe_no";
	private static final String GET_ONE_STMT = 
			"select recipe_no,mem_no,recipe_name,recipe_intro,food_mater,recipe_like,recipe_total_views"
			+ ",recipe_week_views,recipe_time from recipe where recipe_no = ?";
	private static final String DELETE = 
			"DELETE FROM recipe where recipe_no = ?";
	private static final String UPDATE = 
			"UPDATE recipe set recipe_name=?,recipe_intro=?,food_mater=?,recipe_time=sysdate where recipe_no = ?";
	private static final String UPDATEVIEWS = 
			"UPDATE recipe set recipe_total_views=?,recipe_week_views=? where recipe_no = ?";
	private static final String UPDATELIKE =
			"UPDATE recipe set recipe_like=? where recipe_no = ?";
			
			
	
	@Override
	public void insert(RecipeVO recipeVO)
	{
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, psw);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, recipeVO.getMem_no());
			pstmt.setString(2, recipeVO.getRecipe_name());
			pstmt.setString(3, recipeVO.getRecipe_intro());
			pstmt.setString(4, recipeVO.getFood_mater());

			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException se)
		{
			se.printStackTrace();
		} finally
		{
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException se)
				{
					// TODO Auto-generated catch block
					se.printStackTrace();
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				} catch (Exception e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void update(RecipeVO recipeVO)
	{
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, psw);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, recipeVO.getRecipe_name());
			pstmt.setString(2, recipeVO.getRecipe_intro());
			pstmt.setString(3, recipeVO.getFood_mater());
			pstmt.setString(4, recipeVO.getRecipe_no());
			

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void delete(String recipe_no)
	{
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,psw);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, recipe_no);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{
			if(pstmt !=null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con !=null){
				try
				{
					con.close();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public RecipeVO findByPrimaryKey(String recipe_no)
	{
		// TODO Auto-generated method stub
		RecipeVO recipeVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		ResultSetMetaData rsmd = null; 
		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,psw);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,recipe_no);
			rs = pstmt.executeQuery();
				
			while(rs.next())
			{
				recipeVO = new RecipeVO();
				recipeVO.setRecipe_no(rs.getString("recipe_no"));
				recipeVO.setMem_no(rs.getString("mem_no"));
				recipeVO.setRecipe_name(rs.getString("recipe_name"));
				recipeVO.setRecipe_intro(rs.getString("recipe_intro"));
				recipeVO.setFood_mater(rs.getString("food_mater"));
				recipeVO.setRecipe_like(rs.getInt("recipe_like"));
				recipeVO.setRecipe_total_views(rs.getInt("recipe_total_views"));
				recipeVO.setRecipe_week_views(rs.getInt("recipe_week_views"));
				recipeVO.setRecipe_time(rs.getTimestamp("recipe_time"));
				
				
			}
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			if(pstmt !=null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con !=null){
				try
				{
					con.close();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return recipeVO;
	}

	@Override
	public List<RecipeVO> getAll()
	{
		// TODO Auto-generated method stub
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		RecipeVO recipeVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		ResultSetMetaData rsmd = null; 
		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,psw);
			pstmt = con.prepareStatement(Get_ALL_STMT);
			rs = pstmt.executeQuery();
				
			while(rs.next())
			{
				recipeVO = new RecipeVO();
				recipeVO.setRecipe_no(rs.getString("recipe_no"));
				recipeVO.setMem_no(rs.getString("mem_no"));
				recipeVO.setRecipe_name(rs.getString("recipe_name"));
				recipeVO.setRecipe_intro(rs.getString("recipe_intro"));
				recipeVO.setFood_mater(rs.getString("food_mater"));
				recipeVO.setRecipe_like(rs.getInt("recipe_like"));
				recipeVO.setRecipe_total_views(rs.getInt("recipe_total_views"));
				recipeVO.setRecipe_week_views(rs.getInt("recipe_week_views"));
				recipeVO.setRecipe_time(rs.getTimestamp("recipe_time"));
				
				list.add(recipeVO);
			}
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			if(pstmt !=null)
			{
				try
				{
					pstmt.close();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con !=null){
				try
				{
					con.close();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	@Override
	public void updateViews(RecipeVO recipeVO)
	{
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, psw);
			pstmt = con.prepareStatement(UPDATEVIEWS);

			pstmt.setInt(1, recipeVO.getRecipe_total_views());
			pstmt.setInt(2, recipeVO.getRecipe_week_views());
			pstmt.setString(3, recipeVO.getRecipe_no());
			

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void updateLike(RecipeVO recipeVO)
	{
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, psw);
			pstmt = con.prepareStatement(UPDATELIKE);

			pstmt.setInt(1, recipeVO.getRecipe_like());
			pstmt.setString(2, recipeVO.getRecipe_no());
			

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public static void main(String[] args)
	{
		RecipeJDBCDAO dao = new RecipeJDBCDAO();
		
		//insert
		
		//update
//		RecipeVO recipeVO2 = new RecipeVO();
//		recipeVO2.setRecipe_name("修改過的名字");
//		recipeVO2.setRecipe_intro("修改過的簡介");
//		recipeVO2.setFood_mater("食材1-100g+食材2-200g");
//		recipeVO2.setRecipe_no("R00000002");
//		
//		dao.update(recipeVO2);
		
		//update Views
//		RecipeVO recipeVO5 = new RecipeVO();
//		recipeVO5.setRecipe_total_views(20000);
//		recipeVO5.setRecipe_week_views(5000);
//		recipeVO5.setRecipe_no("R00000003");
//		
//		dao.updateViews(recipeVO5);
		
		//update Like
		
//		RecipeVO recipeVO6 = new RecipeVO();
//		recipeVO6.setRecipe_like(888);
//		recipeVO6.setRecipe_no("R00000004");
//		dao.updateLike(recipeVO6);
		
		
		//delete
//		dao.delete("R00000002");
		
		//search target
//		RecipeVO recipeVO3 = dao.findByPrimaryKey("R00000001");
//		System.out.print("| "+recipeVO3.getRecipe_no()+" | ");
//		System.out.print(recipeVO3.getMem_no()+" | ");
//		System.out.print(recipeVO3.getRecipe_name()+" | ");
//		System.out.print(recipeVO3.getRecipe_intro()+" | ");
//		System.out.print(recipeVO3.getFood_mater()+" | ");
//		System.out.print(recipeVO3.getRecipe_like()+" | ");
//		System.out.print(recipeVO3.getRecipe_total_views()+" | ");
//		System.out.print(recipeVO3.getRecipe_week_views()+" | ");
//		System.out.print(new java.text.SimpleDateFormat().format(recipeVO3.getRecipe_time())+" | ");

		//search all
		List<RecipeVO> list = dao.getAll();
		for(RecipeVO recipeVO4: list){
			System.out.print("| "+recipeVO4.getRecipe_no()+" | ");
		System.out.print(recipeVO4.getMem_no()+" | ");
		System.out.print(recipeVO4.getRecipe_name()+" | ");
		System.out.print(recipeVO4.getRecipe_intro()+" | ");
		System.out.print(recipeVO4.getFood_mater()+" | ");
		System.out.print(recipeVO4.getRecipe_like()+" | ");
		System.out.print(recipeVO4.getRecipe_total_views()+" | ");
		System.out.print(recipeVO4.getRecipe_week_views()+" | ");
		System.out.print(recipeVO4.getRecipe_time()+" | ");
			System.out.println();
		}
	}

	
}
