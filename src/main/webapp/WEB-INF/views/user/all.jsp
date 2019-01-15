<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 11.01.19
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All users</title>
</head>
<body>
<table class="darkTable">
    <thead>
    <th scope="row" colspan="6">

        All users:

    </th>

    <tr>
        <td> Id</td>
        <td>First Name</td>
        <td> Last Name</td>
        <td> Email</td>
        <td> EDIT</td>
        <td>DELETE</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="item">
        <tr>
            <td> ${item.id}</td>
            <td> ${item.firstName}</td>
            <td> ${item.lastName}</td>
            <td> ${item.email} </td>
            <td><a href="<c:url value = "/user/edit/${item.id}"/>">EDIT</a></td>
            <td><a href="<c:url value = "/user/delete/${item.id}"/>" class="myButton">DELETE</a></td>
        </tr>
    </c:forEach>
    <tr>
    </tbody>

</table>
</body>
</html>
