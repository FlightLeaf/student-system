<%@ page import="com.util.DBconn" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Leaf
  Date: 2023/4/20
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
  <title>查询结果</title>
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/main_style.css">
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    function openPopup(id) {
      // 定义弹窗的属性
      var width = 800;
      var height = 600;
      var left = (screen.width - width) / 2;
      var top = (screen.height - height) / 2;
      // 打开弹窗并设置其属性
      window.open("updateStudent.jsp?id="+id, "popup_window", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
    }
  </script>
</head>
<body>
<div class="row clearfix">
  <div class="col-md-12 column">
    <h2 class="text-center">
      学生信息查询结果
    </h2><hr>
  </div>
</div>
<div class="col-md-1 column">
</div>
<div class="col-md-10 column">
  <table class="table table-bordered" style="text-align: center">
    <thead>
    <tr>
      <th style="text-align: center">
        学号
      </th>
      <th style="text-align: center">
        班级
      </th>
      <th style="text-align: center">
        姓名
      </th>
      <th style="text-align: center">
        性别
      </th>
      <th style="text-align: center">
        年龄
      </th>
      <th style="text-align: center">
        地址
      </th>
      <th style="text-align: center">
        操作
      </th>
    </tr>
    </thead>
    <%
      DBconn.init();
      ResultSet resultSet = DBconn.selectSql("SELECT * FROM student where "+request.getParameter("inputData")+" like '%"+request.getParameter("exampleInputClass")+"%'");
      String sex = null;
      try {
        while (resultSet.next()){
    %>
    <tbody>
    <tr>
      <td>
        <%=resultSet.getString(1)%>
      </td>
      <td>
        <%=resultSet.getString(2)%>
      </td>
      <td>
        <%=resultSet.getString(3)%>
      </td>
      <td>
        <%
          if(resultSet.getString(4).equals("0")){
            sex = "男";
          }
          else {
            sex = "女";
          }
        %>
        <%=sex%>
      </td>
      <td>
        <%=resultSet.getString(5)%>
      </td>
      <td>
        <%=resultSet.getString(6)%>
      </td>
      <td>
        <a href="#" onclick="openPopup(<%=resultSet.getString(1)%>)" methods="post">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="deleteStudent.jsp?id=<%=resultSet.getString(1)%>" methods="post">删除</a>
      </td>
    </tr>
    </tbody>
    <%
        }
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
    %>
  </table>
</div>
<div class="col-md-1 column">
</div>
</body>
</html>
