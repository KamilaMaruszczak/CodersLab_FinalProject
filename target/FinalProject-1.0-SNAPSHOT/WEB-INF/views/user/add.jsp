<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 11.01.19
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add User</title>
</head>
<body>
Add new User:
<form:form modelAttribute="user" method="post">
    First Name<form:input path="firstName"/><br>
    <form:errors path="firstName" cssClass="error" element="div"/>
    Last Name<form:input path="lastName"/><br>
    <form:errors path="lastName" cssClass="error" element="div"/>
    E-mail<form:input path="email"/><br>
    <form:errors path="email" cssClass="error" element="div"/>
    <input type="submit" value="Wyślij"/>
</form:form>
</body>
</html>
