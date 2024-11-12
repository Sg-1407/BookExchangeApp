
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Book</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<%User us = (User) session.getAttribute("userobj"); %>

						<form action="../add_books" method="post"
							enctype="multipart/form-data">


							<input name="email" type="hidden" value="${userobj.email}"
								class="form-control">




							<div class="form-group">
								<label for="exampleInputEmail1">Book Name <span
									class="text-danger">*</span></label> <input name="bname" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name <span
									class="text-danger">*</span></label> <input name="author" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required>
							</div>


							<div class="form-group">
								<label for="exampleInputGenre">Genre <span
									class="text-danger">*</span></label> <input name="genre" type="text"
									class="form-control" id="exampleInputGenre"
									aria-describedby="genre" required>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price <span
									class="text-danger">*</span></label> <input name="price" type="number"
									class="form-control" id="exampleInputPassword1" required>
							</div>

							<div class="form-group">
								<label for="inputState">Book Condition</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="New">New</option>
									<option value="Old">Old</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Available">Available</option>
									<option value="Not Available">Not Available</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo <span
									class="text-danger">*</span></label> <input name="bimg" type="file"
									class="form-control-file" id="exampleFormControlFile1" required>
							</div>


							<button type="submit" class="btn btn-primary">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>

	<div style="margin-top: 40px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>