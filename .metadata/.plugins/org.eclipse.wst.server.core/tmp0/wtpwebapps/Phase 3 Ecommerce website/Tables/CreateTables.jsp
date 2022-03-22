<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	String q1 = "create table users(name varchar(50), email varchar(100) primary key, mobilenumber bigint, securityQuestion varchar(200), answer varchar(200), password varchar(200), address varchar(500), city varchar(100), state varchar(100), country varchar(100))";
	System.out.println(q1);
	String q2 = "create table products(id int, name varchar(100), category varchar(100), price int, status varchar(50))";
	System.out.println(q2);
	String q3="create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(200), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigint, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionID varchar(100), status varchar(100))";
	System.out.println(q3);
	String q4="create table message(id int AUTO_INCREMENT, email varchar(100), subject varchar(100), body varchar(2000), PRIMARY KEY(id))";
	System.out.println(q4);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
	System.out.println("Table Created");
	con.close();
} catch (Exception e) {	
	System.out.println(e);
}
%>