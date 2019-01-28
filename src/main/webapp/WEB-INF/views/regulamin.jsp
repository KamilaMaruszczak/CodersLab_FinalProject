<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 27.01.19
  Time: 17:45
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

    <object data="/fragments/Regulamin.pdf" type="application/pdf" width="750px" height="750px">
        <embed src="/fragments/Regulamin.pdf" type="application/pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="/fragments/Regulamin.pdf">Download
            PDF</a>.</p>
        </embed>
    </object>
</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
