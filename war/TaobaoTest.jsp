
<%@page import="com.binbin.brand.taobao.APITest"%>
<%@page import="com.binbin.brand.taobao.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String result = APITest.GetTestUserGet();

%>
<%=result %>
<br>
<div>

<a href="<%=APITest.getidentifyURL()%>">使用淘宝登录</a>
</div>
</body>
</html>