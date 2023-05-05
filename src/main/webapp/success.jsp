<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>操作成功</title>
</head>
<body>
<%out.println("<script>alert('操作成功！');history.go(-1);location.reload(true);</script>");%>
</body>
</html>
