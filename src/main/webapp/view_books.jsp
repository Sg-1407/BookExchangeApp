<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DAO.UserDAO"%>

<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">


		<c:if test="${not empty failed }">
			<p class="text-center text-danger">${failed }</p>
			<c:remove var="failed" scope="session" />
		</c:if>

		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white paint-card">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 250px; width: 200px"><br> <br>
				<p>
					<b><%=b.getBookName()%> </b> <br> Author :
					<%=b.getAuthor()%>
					<br> Category :
					<%=b.getBookCategory()%>
					<br>
					<%
					if (b.getBookCategory().equals("Old")) {
					%>
					Status :
					<%=b.getStatus()%>
					<%
					}
					%>
				</p>

			</div>

			<div class="col-md-6  p-5 border bg-white paint-card">
				<h4 class="text-center bg-info text-white p-2">Seller Details:</h4>

				<a href="sellerdetails.jsp">
					<h5 class="text-center text-dark text-bold p-3">
						<i class="far fa-envellope"></i>
						<%=b.getEmail()%></h5>
				</a>
				<p></p>

				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
						Add to Cart</a> <a href="" class="btn btn-success"><i
						class="fas fa-rupee-sign p-1"></i> <%=b.getPrice() %></a>
				</div>

				<div class="text-center p-3">
					<a href="" class="btn btn-secondary text-white">Request For
						Exchange</a>

				</div>

				<div class="row">
					<div class="col-md-4 text-success text-center p-2">
						<i class="fas fa-money-bill-wave fa-1x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-1x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-warning text-center p-2">
						<i class="fas fa-truck-moving fa-1x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

			</div>

		</div>


	</div>
	</div>


</body>
</html>