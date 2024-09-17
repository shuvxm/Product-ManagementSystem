<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 80%;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .action-buttons {
            display: flex;
            justify-content: space-around;
        }
        .action-buttons a {
            text-decoration: none;
            color: #fff;
            padding: 8px 12px;
            border-radius: 4px;
            margin: 0 5px;
        }
        .action-buttons .delete {
            background-color: #dc3545;
        }
        .action-buttons .update {
            background-color: #007bff;
        }
        .action-buttons .delete:hover {
            background-color: #c82333;
        }
        .action-buttons .update:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Product List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Category</th>
                <th>Stock Quantity</th>
                <th>Active</th>
                <th colspan="2">Action</th>
            </tr>
            <%
            ResultSet rs = (ResultSet) request.getAttribute("rs");
            if (rs != null) {
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("product_id") %></td>
                <td><%= rs.getString("product_name") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getInt("stock_quantity") %></td>
                <td><%= rs.getBoolean("is_active") %></td>
                <td class="action-buttons">
                    <a href="delete?id=<%= rs.getInt("product_id") %>" class="delete">Delete</a>
                    <a href="UpdateProductServlet?id=<%= rs.getInt("product_id") %>" class="update">Update</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="8">No products found.</td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>
