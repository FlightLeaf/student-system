<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
  <title>标题栏</title>
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/main_style.css">
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="shortcut icon" href="img/favicon.ico"  type="image/x-icon"/>
</head>
<body>
<div class="col-md-12 column" style="color: black">
  <nav class="navbar navbar-default  navbar-fixed-top" role="navigation" style="width: auto">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      </button>
      <a class="navbar-brand" href="login.jsp"><font style="font-size: 25px">海洋与空间信息学院 &nbsp; </font>学生信息管理系统</a>

    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li>
          <a href="http://ocean.upc.edu.cn/">学院主页</a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">友情链接<strong class="caret"></strong></a>
        <ul class="dropdown-menu">
          <li>
            <a href="https://upc.edu.cn">中国石油大学（华东）</a>
          </li>
          <li class="divider">
          </li>
          <li>
            <a href="https://i.upc.edu.cn">数字石大</a>
          </li>
          <li>
            <a href="https://jwc.upc.edu.cn">教务处</a>
          </li>
        </ul>
        </li>
        &nbsp;&nbsp;&nbsp;
      </ul>
    </div>
  </nav>
</div><br><br><br>
</body>
</html>
