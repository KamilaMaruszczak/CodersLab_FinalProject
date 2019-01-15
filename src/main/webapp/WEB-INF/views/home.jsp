<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 14.01.19
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/views/taglib.jsp" %>
<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<section>
    <div class="border box">
        <div class="calendar">
            <img src="/fragments/images/kalendar.png">
        </div>
        <div>
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
                        <td> ${item.startDate}</td>
                        <td> ${item.endDate}</td>
                        <td> ${item.type}</td>
                        <td> ${item.instructor.name}</td>
                        <td><a href="<c:url value = "/user/login"/>">ZAPISY</a></td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
</html>
