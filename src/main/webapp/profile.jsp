<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<h3 class="text-center text-info">Update Profile</h3>

<hr>
<br>
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

	<form action="index.jsp" method="post" id="update" novalidate>
									<input type="hidden" value="${userobj.id}" name=id/>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name <span class="text-danger">*</span></label> 
								<input
									type="text" class="form-control" name="fname" value="${userobj.name}" required>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address <span class="text-danger">*</span></label> <input
									type="email" class="form-control"value="${userobj.email}"  name="email" required>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No <span class="text-danger">*</span></label> <input
									type="number" class="form-control"  value="${userobj.phno}" name="phno" required>
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputPassword1">Address </label> <input
									type="text" class="form-control"
									<c:if test="${not empty userobj.address}">
				value="${userobj.address}"
			</c:if> id="exampleInputaddress"
									 name="address" >
							</div>
							<div class="form-group">
								<label for="">Landmark </label> <input
									type="text" class="form-control" id="exampleInputlandmarks"  <c:if test="${not empty userobj.landmark}">
		value="${userobj.landmark}"
	</c:if>
									 name="landmark" >
							</div>
							<div class="form-group">
								<label for="">City </label> <input
									type="text" class="form-control" id="exampleInputcity"  <c:if test="${not empty userobj.city}">
		value="${userobj.city}"
	</c:if>
									 name="city" >
							</div>
							<div class="form-group">
								<label for="">State </label> <input
									type="text" class="form-control" id="exampleInputstate"
							 <c:if test="${not empty userobj.state}">
		value="${userobj.state}"
	</c:if>		 name="state" >
							</div>
							<div class="form-group">
								<label for="">Pin-code </label> 
								<input
									type="number" class="form-control" id="exampleInputzip"
									 <c:if test="${not empty userobj.pincode}">
		value="${userobj.pincode}"
	</c:if> name="pincode" >
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password <span class="text-danger">*</span></label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password" required>
							</div>
							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>