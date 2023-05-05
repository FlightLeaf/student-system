<%@ page import="com.util.DBconn" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.entity.Student" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Leaf
  Date: 2023/4/20
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>更新数据</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        <%
            DBconn.init();
            ResultSet resultSet = DBconn.selectSql("SELECT * FROM student where id = '"+request.getParameter("id")+"'");
            Student student = new Student();
                try {
                    while (resultSet.next()){
                        student.setId(resultSet.getString(1));
                        student.setClass_stu(resultSet.getString(2));
                        student.setName(resultSet.getString(3));
                        student.setSex(resultSet.getString(4));
                        student.setAge(resultSet.getString(5));
                        student.setPlace(resultSet.getString(6));
                    }

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBconn.closeConn();
        %>
        $(document).ready(function() {
            $("#exampleInputID").val("<%=student.getId()%>");

            $("#exampleInputClass").val("<%=student.getClass_stu()%>");

            $("#exampleInputName").val("<%=student.getName()%>");

            if("<%=student.getSex()%>"==="0"){
                $("#exampleInputSex").prop("checked", true);
            }else {
                $("#exampleInputSex_w").prop("checked", true);
            }

            $("#exampleInputAge").val("<%=student.getAge()%>");

            $("#exampleInputPlace").val("<%=student.getPlace()%>");
        });
    </script>
</head>
<body>
<br>
<h3>&nbsp;&nbsp;修改学生信息</h3>
<div class="col-md-12 column">
    <form role="form" method="post" action="updateStudentTools.jsp">
        <div class="form-group">
            <label for="exampleInputID">学号</label><input type="text" class="form-control" name="exampleInputID" id="exampleInputID" />
        </div>
        <div class="form-group">
            <label for="exampleInputClass">班级</label><input type="text" class="form-control" name="exampleInputClass" id="exampleInputClass" />
        </div>
        <div class="form-group">
            <label for="exampleInputName">姓名</label><input type="text" class="form-control" name="exampleInputName" id="exampleInputName" />
        </div>
        <div class="form-group">
            <label for="exampleInputSex">性别</label>
            <label><input type="radio" name="sex" value="0" id="exampleInputSex">男</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label><input type="radio" name="sex" value="1" id="exampleInputSex_w">女</label>
        </div>
        <div class="form-group">
            <label for="exampleInputAge">年龄</label><input type="text" class="form-control" name="exampleInputAge" id="exampleInputAge" />
        </div>
        <div class="form-group">
            <label for="exampleInputPlace">地址</label><input type="text" class="form-control" name="exampleInputPlace" id="exampleInputPlace" />
        </div>
        <button type="submit" class="btn btn-lg btn-block">修改学生信息</button>
    </form>
</div>
</body>
</html>
