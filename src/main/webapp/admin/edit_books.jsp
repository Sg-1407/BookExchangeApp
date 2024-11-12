
<%@page import="java.util.List"%>
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
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="caontainer">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>

						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name <span
									class="text-danger">*</span></label> <input name="bname" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name <span
									class="text-danger">*</span></label> <input name="author" type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputGenre">Genre <span
									class="text-danger">*</span></label> <input name="genre" type="text"
									class="form-control" id="exampleInputGenre"
									aria-describedby="genre" value="<%=b.getGenre() %>" required>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Price <span
									class="text-danger">*</span></label> <input name="price" type="number"
									class="form-control" id="exampleInputPassword1"
									value="<%=b.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Available".equals(b.getStatus())) {
									%>
									<option value="Available">Available</option>
									<option value="Not Available">Not Available</option>
									<%
									} else {
									%>
									<option value="Available">Available</option>
									<option value="Not Available">Not Available</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
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