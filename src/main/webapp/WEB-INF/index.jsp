<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Spring Boot First App</title>
</head>
<body>
<%request.getRequestDispatcher("/WEB-INF/new.jsp").forward(request,response);%>

</body>
</html>
