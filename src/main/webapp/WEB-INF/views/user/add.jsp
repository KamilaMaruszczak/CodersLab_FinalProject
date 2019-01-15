<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 11.01.19
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/views/taglib.jsp" %>
<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<section>
    <div class="border box">
Add new User:
<form:form modelAttribute="user" method="post">
    First Name<form:input path="name"/><br>
    <form:errors path="name" cssClass="error" element="div"/>
    Password<form:input path="password"/><br>
    <form:errors path="password" cssClass="error" element="div"/>
    E-mail<form:input path="email"/><br>
    <form:errors path="email" cssClass="error" element="div"/>
    E-mail<form:input path="phone"/><br>
    <form:errors path="phone" cssClass="error" element="div"/>
    <input type="submit" value="Wyślij"/>
</form:form>
    </div>
</section>
</body>
</html>
