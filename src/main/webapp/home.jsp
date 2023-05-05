<%@ page import="com.util.JDBCUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.dao.StudentDao" %>
<%@ page import="com.entity.Student" %>
<%@ page import="java.util.List" %>
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
    <style>
        .bjimg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            min-width: 1000px;
            z-index: -10;
            zoom: 1;
            background-color: #fff;
            background-image: url(img/二号海洋.jpg) ;
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            background-position: center 0;
        }
    </style>
</head>
<body>
<%@include file="head.jsp"%>
<div class="bjimg"></div>
<br>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-1 column"></div>
        <div class="col-md-10 column" style="background-color: rgba(255,255,255,0.88);border-radius: 12px">
            <br>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <h2 class="text-center">
                        学生信息管理
                    </h2><hr>
                </div>
            </div>
            <div class="row clearfix">

                <%
                    int pageSize = 18;
                    int page_ = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                    int total = (new StudentDao()).getTotal();
                    int pageCount = (int) Math.ceil((double) total / pageSize);
                    List<Student> dataList = (new StudentDao()).getDataList(page_, pageSize);
                %>


            </div>
            <div class="row clearfix">
                <div class="col-md-1 column">
                </div>
                <div class="col-md-7 column">
                    <table class="table table-striped" style="text-align: center">
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
                        <tbody>
                        <% for (Student data : dataList) { %>
                        <tr>
                            <td><%= data.getId() %></td>
                            <td><%= data.getClass_stu() %></td>
                            <td><%= data.getName() %></td>
                            <td><%= data.getSex() %></td>
                            <td><%= data.getAge() %></td>
                            <td><%= data.getPlace() %></td>
                            <td>
                                <a href="#" onclick="openPopup(<%= data.getId() %>)" methods="post">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="deleteStudent.jsp?id=<%= data.getId() %>" methods="post">删除</a>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                    <div style="text-align: center;font-size: 18px">
                        <%-- 上一页 --%>
                        <% if (page_ > 1) { %>
                        <a href="?page=<%= page_ - 1 %>">上一页</a>
                        <% } else { %>
                        <span>上一页</span>
                        <% } %>&nbsp;
                        <%-- 分页条，最多显示10页 --%>
                        <% int startPage = Math.max(1, page_ - 5); %>
                        <% int endPage = Math.min(pageCount, startPage + 9); %>
                        <% for (int i = startPage; i <= endPage; i++) { %>
                        <% if (i == page_) { %>
                        <span><%= i %></span>
                        <% } else { %>
                        <a href="?page=<%= i %>"><%= i %></a>
                        <% } %>
                        <% } %>&nbsp;
                        <%-- 下一页 --%>
                        <% if (page_ < pageCount) { %>
                        <a href="?page=<%= page_ + 1 %>">下一页</a>
                        <% } else { %>&nbsp;
                        <span>下一页</span>
                        <% } %>
                    </div>

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
                            <label for="exampleInputID">学号</label><input type="text" class="form-control" name="exampleInputID" id="exampleInputID"  required="required" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputClass">班级</label><input type="text" class="form-control" name="exampleInputClass" id="exampleInputClass"  required="required" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputName">姓名</label><input type="text" class="form-control" name="exampleInputName" id="exampleInputName"  required="required" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputSex">性别</label>
                            <label><input type="radio" name="sex" value="男" id="exampleInputSex">男</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="sex" value="女">女</label>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAge">年龄</label><input type="text" class="form-control" name="exampleInputAge" id="exampleInputAge" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPlace">地址</label><input type="text" class="form-control" name="exampleInputPlace" id="exampleInputPlace" />
                        </div>
                        <button type="submit" class="btn btn-block btn-lg btn-info">添加学生信息</button>
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
                            <label for="Input">查询</label><input type="text" class="form-control" name="exampleInputClass" id="Input"  required="required"/>
                        </div>
                        <button type="submit" class="btn btn-block btn-lg btn-info">查询学生信息</button>
                    </form>
                </div>
                <div class="col-md-1 column">
                </div>
            </div><br>
        </div>
        <div class="col-md-1 column"></div>
    </div>
</div>
<br><br>
</body>
</html>
