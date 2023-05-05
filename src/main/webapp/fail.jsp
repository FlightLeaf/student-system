<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>操作失败</title>
</head>
<body>
<%out.println("<script>alert('操作失败！');history.go(-1);location.reload(true);</script>");%>
</body>
</html>
