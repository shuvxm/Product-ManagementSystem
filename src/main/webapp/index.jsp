<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	height: 80vh;
}

.main-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
}

.container a {
	float: right;
	margin-top: -20%;
}

.container h1 {
	background-color: #8e24aa;
	color: #e0e0e0;
}

h1 {
	text-align: center;
	color: #333;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #555;
}

input[type="text"], input[type="number"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: purple;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	display: flex;
	margin: 0 auto;
}

button:hover {
	background-color: #00bfa5;
}

.head {
	font-size: 2.5rem;
}
</style>
</head>
<body>
	<h1 class="head">Product Management System</h1>
	<div class="main-container">
		<div class="container">
			<h1>Add Product</h1>
			<a href="DisplayProductsServlet">View Products</a>
			<form action="AddProduct" method="post">
				<label for="prodId">Product Id:</label> 
				<input type="number" name="id" id="prodId" required> 
				
				<label for="prodName">Product Name:</label> 
				<input type="text" name="name" id="prodName" required>

				<label for="prodDesc">Description:</label> 
				<input type="text" name="desc" id="prodDesc"> 
				
				<label for="prodPrice">Price:</label>
				<input type="number" step="0.01" name="price" id="prodPrice" required> 
					
				<label for="prodCategory">Category:</label> 
				<input type="text" name="category" id="prodCategory"> 
				
				<label	for="prodQuantity">Stock Quantity:</label> 
				<input type="number" name="quantity" id="prodQuantity" required> 
				
				<label for="prodActive">Active:</label> 
				<input type="text" name="active" id="prodActive" value="true" required>

				<button type="submit">Submit</button>
			</form>
		</div>

	</div>
</body>
</html>
