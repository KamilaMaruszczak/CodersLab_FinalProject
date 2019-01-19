<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 17.01.19
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<c:choose>
    <c:when test="${instructor}">

        <%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>

    </c:when>
</c:choose>


<section>

    <div class="border box">
        <div class="text-center"><p>Czy chcesz się wylogować?</p><br></div>
        <div class="row">
            <div class="mx-auto">
                <a href="logout">
                    <button class="myButton">WYLOGUJ</button>
                </a>
                <a href="/">
                    <button class="myButton">ZREZYGNUJ</button>
                </a>
            </div>
        </div>
    </div>
</section>
</body>
</html>