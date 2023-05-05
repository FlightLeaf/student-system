<%@ page import="com.dao.UserDao" %>
<%@ page import="com.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>ID判断</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  UserDao userDao = new UserDao();
  String uname = request.getParameter("uname");
  if(!userDao.IDJudgment(uname)){
    response.getWriter().write("邮箱已存在");
  } else {
    response.getWriter().write("邮箱可以使用");
  }
%>
</body>
</html>
