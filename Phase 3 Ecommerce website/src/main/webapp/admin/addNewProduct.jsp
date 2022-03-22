<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Added Successfully!</h3>
<%
}
%>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%
}
%>

<%
int id=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from products");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <%=id %></h3>
<input type="hidden" name="id" value="<%=id%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class = "input-style" type="text" name="name" placeholder="Product Name">
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
  <input class = "input-style" type="text" name="category" placeholder="Product Category">
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
  <input class = "input-style" type="text" name="price" placeholder="Product Price">
<hr>
</div>

<div class="right-div">
<h3>Status</h3>
   <select class="input-style" name="status">
   <option value="Active">Active</option>
   <option value="InActive">InActive</option>
   </select>
<hr>
</div>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>