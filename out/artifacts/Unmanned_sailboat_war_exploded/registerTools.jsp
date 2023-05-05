<%@ page import="com.entity.User" %>
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
    <title>注册验证页面</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");
    String password = request.getParameter("password");
    User user = new User(name,email,password,tel);
    UserDao userDao = new UserDao();
    if(userDao.register(user)){
        response.sendRedirect("success.jsp");
    } else {%>
    <div class="alert alert-danger" role="alert">
        注册失败！！！
    </div>
<%}%>
</body>
</html>
