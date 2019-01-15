<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 15.01.19
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/views/taglib.jsp" %>
<%@ include file="/WEB-INF/views/head.jsp" %>
<table class="paleBlueRows">
    <thead>
    <tr>
        <th scope="5">Lista dostepnych kursów 2019</th>
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
            <td><a href="<c:url value = "/user/add"/>">ZAPISY</a></td>

        </tr>
    </c:forEach>
    <tr>
        <td>cell1_2</td>
        <td>cell2_2</td>
        <td>cell3_2</td>
        <td>cell4_2</td>
        <td>cell5_2</td>
    </tr>
    </tbody>
</table>