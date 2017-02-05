<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<title>Build-A-Burger</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Logo</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Projects</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"><!-- <img src="burger-solid.png" /> --></div>
			
			
			<div class="col-sm-8 text-left">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-2" for="text">Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" value="${burger.name}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Description:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="description" value="${burger.description}">
						</div>
					</div>
				<c:forEach var="ingredient" items="${burger.ingredients}">
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Ingredient:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="description" value="${ingredient.name}">
						</div>
					</div>
				</c:forEach>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Button</button>
						</div>
					</div>
				</form>

			</div>


			<div class="col-sm-2 sidenav">
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						data-toggle="dropdown">
						Ingredients <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li class="dropdown-header">Bun</li>
						<li><a href="#">Sesame Seed Bun</a></li>
						<li><a href="#">Texas Toast</a></li>
						<li><a href="#">Lettuce Wrap</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Protein</li>
						<li><a href="#">Beef Patty</a></li>
						<li><a href="#">Chicken Breast</a></li>
						<li><a href="#">Veggie Patty</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Cheese</li>
						<li><a href="#">American Cheese</a></li>
						<li><a href="#">Cheddar Cheese</a></li>
						<li><a href="#">Blue Cheese</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Sauce</li>
						<li><a href="#">Ketchup</a></li>
						<li><a href="#">Mustard</a></li>
						<li><a href="#">BBQ Sauce</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Topping</li>
						<li><a href="#">Tomatoes</a></li>
						<li><a href="#">Pickles</a></li>
						<li><a href="#">Onions</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
	<!-- <p>Footer Text</p> -->
	</footer>

</body>
</html>