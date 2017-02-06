<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	-->
	
	<title>Burger List</title>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
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
		
		
		<div class="col-sm-8 text-left"> 
			<h1>Burger List</h1>
			<ul class="list-unstyled">
			<c:forEach var="info" items="${burgerInfos}">
				<li>
					<h3>
						<span class="glyphicons glyphicons-fast-food"></span><a href="viewBurger.do?burgerId=${info.id}">${info.name}</a> <small>${info.description}</small>
						<a class="btn btn-default pull-right" href="destroyBurger.do?burgerId=${info.id}"></span>delete</a>
						
						<a class="btn btn-default pull-right" href="viewBurger.do?burgerId=${info.id}">update</a>
					</h3>
				</li>
			</c:forEach>
			</ul>
			
			<hr>
			<a href="burgerCreateForm.do" class="btn btn-primary pull-right">build-a-burger</a>
			
		</div>
		<div class="col-sm-2 sidenav">
		</div>
	</div>
</div>

<footer class="container-fluid text-center">
<!--   <p>Footer Text</p> -->
</footer>

</body>
</html>
