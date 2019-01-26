<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 21.01.19
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<body>
<c:choose>
    <c:when test="${instructor}">

        <%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>

    </c:when>
</c:choose>


<div class="border box">
    <div class="text-center"><p>Moje zapisy:</p><br></div>
    <table class="paleBlueRows">
        <thead>
        <tr></tr>
        <tr>
            <th>Żeglarz</th>
            <th>Data rozpoczęcia</th>
            <th>Data zakończenia</th>
            <th>Klasa</th>
            <th>Instruktor</th>
            <th>Usuń Zapis</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sailorCourseList}" var="sailorCourse">
            <tr>
                <td>${sailorCourse.sailor.name}</td>
                <td><fmt:formatDate value='${sailorCourse.course.startDate}' pattern='dd-MM-yyyy'/></td>
                <td><fmt:formatDate value='${sailorCourse.course.endDate}' pattern='dd-MM-yyyy'/></td>
                <td>${sailorCourse.course.type}</td>
                <td>${sailorCourse.course.instructor.name}</td>
                <td><a href="<c:url value = "/sailor/delete/${sailorCourse.id}"/>">USUŃ</a></td>
                </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
