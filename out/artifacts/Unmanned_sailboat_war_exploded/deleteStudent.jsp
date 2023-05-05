<%@ page import="com.dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: Leaf
  Date: 2023/4/20
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    StudentDao studentDao = new StudentDao();
    if(studentDao.delete(id)){
        response.sendRedirect("success.jsp");
    } else {%>
<div class="alert alert-danger" role="alert">
    删除失败！！！
</div>
<%}%>
</body>
</html>
