<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 18.01.19
  Time: 09:55
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

<section>


    <div class="border box">
        <div class="mx-auto my-4">
            <img src="/fragments/images/optymist.png">
        </div>
        <div class="mx-auto my-4">
            <img src="/fragments/images/europa.JPG">
        </div>
    </div>
</section>

</body>
</html>
