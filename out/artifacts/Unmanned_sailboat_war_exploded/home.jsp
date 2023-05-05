<%@ page import="com.util.DBconn" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: Leaf
  Date: 2023/4/19
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>主页</title>
    <link href="css/main_style.css">
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
<%@include file="head.jsp"%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <h2 class="text-center">
                        学生信息管理
                    </h2><hr>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-4 column">
                </div>
                <div class="col-md-4 column">
                </div>
                <div class="col-md-4 column">
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-1 column">
                </div>
                <div class="col-md-7 column">
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
                            ResultSet resultSet = DBconn.selectSql("SELECT * FROM student");
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
                <div class="col-md-3 column">
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <h3 class="text-center">
                                添加学生信息
                            </h3><hr>
                        </div>
                    </div>
                    <form role="form" method="post" action="addStudent.jsp">
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
                            <label><input type="radio" name="sex" value="1">女</label>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAge">年龄</label><input type="text" class="form-control" name="exampleInputAge" id="exampleInputAge" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPlace">地址</label><input type="text" class="form-control" name="exampleInputPlace" id="exampleInputPlace" />
                        </div>
                        <button type="submit" class="btn btn-lg btn-block">添加学生信息</button>
                    </form><hr>
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <h3 class="text-center">
                                查询学生信息
                            </h3>
                        </div>
                    </div>
                    <form role="form" method="post" action="result.jsp">
                        <div class="form-group">
                            <label for="exampleSelect">查询依据</label>
                            <select class="form-control" id="exampleSelect" name="inputData">
                                <option value="">请选择...</option>
                                <option value="id">学号</option>
                                <option value="name">姓名</option>
                                <option value="class">班级</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="Input">查询</label><input type="text" class="form-control" name="exampleInputClass" id="Input" />
                        </div>
                        <button type="submit" class="btn btn-lg btn-block">添加学生信息</button>
                    </form>
                </div>
                <div class="col-md-1 column">
                </div>

            </div>
            <div class="row clearfix">
            </div>
        </div>
    </div>
</div>
</body>
</html>
