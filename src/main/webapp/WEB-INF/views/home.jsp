<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 14.01.19
  Time: 15:22
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

<section>


    <div class="border box">
        <div class="row">
            <div class="mx-auto my-4">
                <img src="/fragments/images/kalendar.png">
            </div>
        </div>
        <div class="my-4">
            <table class="paleBlueRows">
                <thead>
                <tr>
                    <th scope="row" colspan="5">Lista dostepnych kursów 2019</th>
                </tr>
                <tr>
                    <th>Data rozpoczęcia</th>
                    <th>Data zakończenia</th>
                    <th>Klasa</th>
                    <th>Instruktor</th>
                    <th>Zapisy</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${courses}" var="item">
                    <tr>
                        <td><fmt:formatDate value='${item.startDate}' pattern='dd-MM-yyyy'/></td>
                        <td><fmt:formatDate value='${item.endDate}' pattern='dd-MM-yyyy'/></td>
                        <td> ${item.type}</td>
                        <td> ${item.instructor.name}</td>
                        <td><a href="<c:url value = "/user/course/${item.id}"/>">ZAPISY</a></td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
</html>
