<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Exchange Platform</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: linear-gradient(rgba(0, 0, 0, .1), rgba(0, 0, 0, .1)),
		url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body style="background-color: #f7f7f7;">

	<c:if test="${not empty addCart}">

	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<%
	User u=(User)session.getAttribute("userobj"); 
	%>

	<div class="container-fluid back-img">
		<h2 class="text-center text-success p-5">Book Exchange Platform</h2>
	</div>


	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center p-2">Latest Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3 p-2">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%><br>
							<%=b.getAuthor()%><br>

							<%=b.getGenre()%>
							<br>
							<%=b.getStatus()%>
							<br>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<%if(u==null){ %>

							<a href="login.jsp" class="btn btn-success btn-sm ml-1">View
								Details</a>
							<%}else{ %>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>

							<%} %>
							<a href="" class="btn btn-danger text-white btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign p-1"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">



							<%if(u==null){ %>

							<a href="login.jsp" class="btn btn-success btn-sm ml-1">View
								Details</a>
							<%}else{ %>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>

							<%} %>
							<a class="btn btn-danger text-white btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign p-1"></i></a>
						</div>
						<%
						}
						%>


					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">

			<%if(u==null){ %>

			<a href="login.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%}else{ %>

			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>

			<%
						}
						%>

		</div>
	</div>

	<hr>

	<!-- Start new Book -->

	<div class="container">
		<h3 class="text-center p-2">New Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3 p-2">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%><br>
							<%=b.getAuthor()%><br>
							<%=b.getGenre()%><br><%=b.getStatus()%><br> Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<%if(u==null){ %>
							<a href="login.jsp" class="btn btn-warning btn-sm ml-1">Add
								to Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-1">View
								Details</a>

							<%}else{ %>
							<a href="index.jsp" class="btn btn-warning btn-sm ml-1">Add
								to Cart</a> <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>

							<%} %>
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign p-1"></i></a>
						</div>


					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">

			<%if(u==null){ %>

			<a href="login.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%}else{ %>

			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>

			<%
						}
						%>

		</div>
	</div>

	<hr>

	<!-- Start old Book -->

	<div class="container">
		<h3 class="text-center p-2">Old Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3 p-2">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%><br>
							<%=b.getAuthor()%><br>
							<%=b.getGenre()%>
							<br>
							<%=b.getStatus()%><br> Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<%if(u==null){ %>
							<a href="login.jsp" class="btn btn-warning btn-sm ml-1">Add
								to Cart</a> <a href="login.jsp" class="btn btn-success btn-sm ml-1">View
								Details</a>
							<%}else{ %>
							<a href="index.jsp%>" class="btn btn-warning btn-sm ml-1">Add
								to Cart</a> <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>

							<%} %>

							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign p-1"></i></a>
						</div>


					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">

			<%if(u==null){ %>

			<a href="login.jsp" class="btn btn-danger btn-sm text-white">View
				Alls</a>
			<%}else{ %>

			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>

			<%
						}
						%>

		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>