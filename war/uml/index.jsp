<%@page import="com.binbin.brand.ThirdBrand"%>
<%@page import="java.util.List"%>
<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.binbin.guestbook.Greeting"%>
<%@page import="com.binbin.PMF"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/shared/head.html" />
<script type="text/javascript">
	$(function() {
		$('#tabs').tabs();
	});
</script>
</head>
<body>
	<h1>binbin's project brand</h1>
	<jsp:include page="/shared/header.html" />
	<div id="tabs">
		<ul>
			<li><a href="#tab1"><span>tab1</span> </a></li>
			<li><a href="#tab2"><span>tab2</span> </a></li>
		</ul>
		<div id="tab1">
			<%
				UserService userService = UserServiceFactory.getUserService();
				User user = userService.getCurrentUser();
				if (user != null) {
			%>
			<p>
				Hello,
				<%=user.getNickname()%>! (You can <a
					href="<%=userService.createLogoutURL(request.getRequestURI())%>">sign
					out</a>.)
			</p>
			<%
				} else {
			%>
			<p>
				Hello! <a
					href="<%=userService.createLoginURL(request.getRequestURI())%>">Sign
					in</a> to include your name with greetings you post.
			</p>
			<%
				}
			%>

			<%
				PersistenceManager pm = PMF.get().getPersistenceManager();
				String query = "select from " + ThirdBrand.class.getName();
				List<ThirdBrand> greetings = (List<ThirdBrand>) pm.newQuery(query)
						.execute();
				if (greetings.isEmpty()) {
			%>
			<p>没有品牌</p>
			<%
				} else {
					for (ThirdBrand g : greetings) {
						String author = "匿名";
						if (g.getAuthor() != null) {
							author = g.getAuthor().getNickname();
						}
						String name = g.getName();
			%>

			<p>
				<b><%=author%></b> wrote:
			</p>

			<blockquote><%=name%></blockquote>
			<%
				}
				}
				pm.close();
			%>

			<form action="/brand/thirdbrandaddservlet" method="post">
				<div>
					<span>品牌名称：</span><input type=text name="name"> </input>
				</div>
				<div>
					<input type="submit" value="添加" />
				</div>
			</form>
		</div>
		<div id="tab2"></div>
	</div>


</body>
</html>