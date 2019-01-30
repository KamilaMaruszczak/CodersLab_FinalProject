<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 27.01.19
  Time: 19:16
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
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>


<div class="border box">
    <div class="my-4">
        <table class="table table-striped text-center">
            <thead>
            <tr>
                <th scope="row" colspan="6"><h3>Lista zarejestrowanych użytkowników</h3></th>
            </tr>
            <tr>
                <th class="align-middle"></th>
                <th class="align-middle">Imię i Nazwisko</th>
                <th class="align-middle">Email</th>
                <th class="align-middle">Telefon</th>
                <th class="align-middle">Instruktor</th>

                <c:if test="${admin}">
                        <th class="align-middle">Usuń</th>
                </c:if>


            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user" varStatus="i">
                <tr>
                    <td class="align-middle">${i.index+1}</td>
                    <td class="align-middle">${user.name}</td>
                    <td class="align-middle"> ${user.email}</td>
                    <td class="align-middle"> ${user.phone}</td>
                    <td class="align-middle">

                        <c:if test="${user.instructor}">
                        INSTRUKTOR
                        </c:if>


                        <c:if test="${admin}">
                            <td class="align-middle">
                                <a href="<c:url value = "/user/delete/${user.id}"/>">USUŃ</a>
                            </td>
                    </c:if>


                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</body>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
