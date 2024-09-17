package com.sample;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            // Change the connection URL and driver for PostgreSQL
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Amazon", "postgres", "root");
            ps = con.prepareStatement("SELECT * FROM product WHERE product_id = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                req.setAttribute("product", rs);
                RequestDispatcher rd = req.getRequestDispatcher("updateProduct.jsp");
                rd.forward(req, resp);
            } else {
                resp.sendRedirect("errorPage.jsp"); // Redirect to an error page or handle as needed
            }
        } catch (SQLException | ClassNotFoundException | NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect("errorPage.jsp"); // Redirect to an error page or handle as needed
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int prodID = Integer.parseInt(req.getParameter("product_id"));
        String prodName = req.getParameter("product_name");
        String prodDesc = req.getParameter("description");
        double prodPrice = Double.parseDouble(req.getParameter("price"));
        String prodCategory = req.getParameter("category");
        int stockQuantity = Integer.parseInt(req.getParameter("stock_quantity"));
        boolean isActive = Boolean.parseBoolean(req.getParameter("is_active"));

        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            // Change the connection URL and driver for PostgreSQL
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Amazon", "postgres", "root");

            // Update the product details
            String sql = "UPDATE product SET product_name = ?, description = ?, price = ?, category = ?, stock_quantity = ?, is_active = ? WHERE product_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, prodName);
            ps.setString(2, prodDesc);
            ps.setDouble(3, prodPrice);
            ps.setString(4, prodCategory);
            ps.setInt(5, stockQuantity);
            ps.setBoolean(6, isActive);
            ps.setInt(7, prodID);
            
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                resp.sendRedirect("DisplayProductsServlet"); // Redirect to the list of products
            } else {
                resp.getWriter().println("Error updating product");
            }
            
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
