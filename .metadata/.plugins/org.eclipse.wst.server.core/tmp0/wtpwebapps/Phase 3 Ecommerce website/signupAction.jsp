<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("phonenumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city = "";
String state = "";
String country = "";

try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement st = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	st.setString(1, name);
	st.setString(2, email);
	st.setString(3, mobilenumber);
	st.setString(4, securityQuestion);
	st.setString(5, answer);
	st.setString(6, password);
	st.setString(7, address);
	st.setString(8, city);
	st.setString(9, state);
	st.setString(10, country);
	st.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
} catch (Exception e) {
	response.sendRedirect("signup.jsp?msg=invalid");
	System.out.println(e);
}
%>