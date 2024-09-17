<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product Page</title>
</head>
<body>
    <header>
        <nav>
            <div class="logo">PMS</div>
            <a href="Login.jsp">Logout</a>
        </nav>
    </header>
    <main>
        <div class="form-container">
            <h1>Update Product Details</h1>
            <%
                ResultSet product = (ResultSet) request.getAttribute("product");
                if (product != null) { // Ensure the ResultSet is not null and move to the first row
            %>
            <form action="UpdateProductServlet" method="post">
                <input type="text" name="product_id" value="<%= product.getInt("product_id") %>" />
                
                <label for="product_name">Product Name:</label>
                <input type="text" id="product_name" name="product_name" value="<%= product.getString("product_name") %>" required />
                
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" required><%= product.getString("description") %></textarea>
                
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" value="<%= product.getDouble("price") %>" step="0.01" required />
                
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" value="<%= product.getString("category") %>" required />
                
                <label for="stock_quantity">Stock Quantity:</label>
                <input type="number" id="stock_quantity" name="stock_quantity" value="<%= product.getInt("stock_quantity") %>" required />
                
                <label for="is_active">Active:</label>
                <select id="is_active" name="is_active" required>
                    <option value="true" <%= product.getBoolean("is_active") ? "selected" : "" %>>Yes</option>
                    <option value="false" <%= !product.getBoolean("is_active") ? "selected" : "" %>>No</option>
                </select>
                
                <input type="submit" value="Update" />
            </form>
            <% } else { %>
                <p>No product found to update.</p>
            <% } %>
        </div>
    </main>
</body>
</html>
