<%@ page import="com.dao.UserDao" %>
<%@ page import="com.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: Leaf
  Date: 2023/4/19
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>登录验证</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <hr>
        <%
            request.setCharacterEncoding("UTF-8");
            String username = request.getParameter("email");
            String password = request.getParameter("password");
            UserDao userDao = new UserDao();
            if (userDao.login(username,password)) {
                response.sendRedirect("home.jsp");
            } else { %>
        <div class="alert alert-danger" role="alert">
            登录失败，请检查您的用户名和密码！
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
