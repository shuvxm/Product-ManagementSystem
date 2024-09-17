package com.sample;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AddProduct")
public class AddProductServlet extends HttpServlet {
	
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        // Redirect to the add product form page
	        RequestDispatcher rd = req.getRequestDispatcher("addProduct.jsp");
	        rd.forward(req, resp);
	    }
	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int prodID = Integer.parseInt(req.getParameter("id")) ;
		String prodName = req.getParameter("name");
		String prodDesc = req.getParameter("desc");	
		double prodPrice = Double.parseDouble(req.getParameter("price"));
		String prodcategory = req.getParameter("category");
		int StockQuantity = Integer.parseInt(req.getParameter("quantity"));	
		boolean isActive = Boolean.parseBoolean( req.getParameter("active"));
	
		
		Connection con = null;
		PreparedStatement ps = null;
		
		   // Database connection
//			Class.forName("org.postgresql.Driver");
//			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Amazon", "postgres", "root");
			
		try {
            // Load MySQL JDBC Driver
//            Class.forName("com.mysql.cj.jdbc.Driver");
			// Establish connection to the database
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amazon", "root", "root");
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Amazon", "postgres", "root");
            // Prepare SQL statement to insert product data
            String sql = "INSERT INTO product (product_id, product_name, description, price, category, stock_quantity, is_active) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            ps.setInt(1, prodID);
            ps.setString(2, prodName);
            ps.setString(3, prodDesc);
            ps.setDouble(4, prodPrice);
            ps.setString(5, prodcategory);
            ps.setInt(6, StockQuantity);
            ps.setBoolean(7, isActive);

            ps.executeUpdate();

            // Redirect to the servlet that displays all products
            resp.sendRedirect("DisplayProductsServlet");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	
	}

}
