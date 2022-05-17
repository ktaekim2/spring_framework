<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-17
  Time: 오전 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>index.jsp</h2>
<%-- server에게 /welcome 주소를 get방식으로 요청 --%>
<a href="welcome">welcome 페이지로 이동</a>
<%-- .jsp에서 .jsp로 이동X. 무조건 Controller로 요청해서 Controller가 해당 화면 띄어줌 --%>
<%-- 링크 클릭하면 form-ex.jsp 출력 --%>
<a href="form-ex">form-ex 페이지로 이동</a>
</body>
</html>
