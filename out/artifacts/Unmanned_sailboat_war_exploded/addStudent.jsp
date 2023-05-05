<%@ page import="com.entity.Student" %>
<%@ page import="com.dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: Leaf
  Date: 2023/4/20
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>添加学生</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("exampleInputID");
    String classNum = request.getParameter("exampleInputClass");
    String name = request.getParameter("exampleInputName");
    String sex = (request.getParameter("sex"));
    String age = (request.getParameter("exampleInputAge"));
    String place = request.getParameter("exampleInputPlace");
    Student student = new Student(id, classNum, name, sex, age, place);
    StudentDao studentDao = new StudentDao();
    if(studentDao.register(student)){
        response.sendRedirect("success.jsp");
    } else {%>
    <div class="alert alert-danger" role="alert">
        添加失败！！！
    </div>
<%}%>
</body>
</html>
