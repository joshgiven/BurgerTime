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
	
	<c:choose>
		<c:when test="${burger == null}">
			<title>Build-A-Burger</title>
		</c:when>
		<c:otherwise>
			<title>Edit-A-Burger</title>
		</c:otherwise>
	</c:choose>
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
				<li class="active"><a href="/BurgerTime/">Home</a></li>
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
			
			
		<c:choose>
		<c:when test="${burger == null}">
					
			<div class="col-sm-8 text-left">
			
				<form class="form-horizontal" method="GET" action="createBurger.do">
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name" value="${burger.name}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="description">Description:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="description" value="${burger.description}">
						</div>
					</div>
 				<c:forEach var="iList" items="${ ingredientLists }">
 					<c:set var="type" value="iList.key"></c:set>
 					<c:set var="ingredients" value="iList.value"></c:set>
 					
					<div class="form-group">
						<label class="control-label col-sm-2" for="ingredient">${iList.key}:</label>
						<div class="col-sm-10">
							<!-- <input type="text" class="form-control" name="ingredient" > -->
							<select name="ingredientId" class="form-control" >
							<c:forEach var="ingredient" items="${iList.value}">
								<option value="${ingredient.id}">${ingredient.name}</option>
							</c:forEach>
							</select>
						</div>
					</div>
				</c:forEach>
 					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Create</button>
						</div>
					</div>
				</form>
			</div>
		
		</c:when>
		<c:otherwise>
<%-- 			
			<hr>
			${ ingredientLists }
			<hr>
			${ ingredientLists["bun"] }
			<hr>
			${ ingredientLists.get("bun") }
 --%>		
			<div class="col-sm-8 text-left">
				<form class="form-horizontal" method="POST" action="updateBurger.do">
					<input type="hidden" name="id" value="${burger.id}" >
					<div class="form-group">
						<label class="control-label col-sm-2" for="text">Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name" value="${burger.name}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Description:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="description" value="${burger.description}">
						</div>
					</div>
				<c:forEach var="ingredient" items="${burger.ingredients}">
					<div class="form-group">
						<label class="control-label col-sm-2" for="ingredientId">${ingredient.ingredientType}:</label>
						<div class="col-sm-10">
							<select name="ingredientId" class="form-control">
							<c:forEach var="choice" items="${ingredientLists.get(ingredient.ingredientType)}">
							<option value="${choice.id}" <c:if test="${ choice.id == ingredient.id }">selected</c:if> > ${choice.name} </option>
							</c:forEach>
							</select>
						</div>
					</div>
				</c:forEach>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Update</button>
						</div>
					</div>
				</form>
			</div>

		
		</c:otherwise>
		</c:choose>
	
			


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