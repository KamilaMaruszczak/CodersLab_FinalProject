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


<section>


    <div class="border box">
        <div class="row">
            <div class="mx-auto my-4">
                <img src="/fragments/images/kalendar.png">
            </div>
        </div>
        <div class="my-4">
            <table id="courses" class="paleBlueRows">
                <thead>
                <tr>
                    <th scope="row" colspan="7">Lista dostepnych kursów 2019</th>
                </tr>
                <tr>
                    <th>Data rozpoczęcia</th>
                    <th>Data zakończenia</th>
                    <th>Klasa</th>
                    <th>Instruktor</th>
                    <th>Ilość zapisanych</th>
                    <th>Edytuj</th>
                    <th>Usuń</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${courses}" var="item" varStatus="i">
                    <tr data-toggle="collapse" data-target="#${i.index}" class="accordion-toggle bold">
                        <td><fmt:formatDate value='${item.startDate}' pattern='dd-MM-yyyy'/></td>
                        <td><fmt:formatDate value='${item.endDate}' pattern='dd-MM-yyyy'/></td>
                        <td> ${item.type}</td>
                        <td> ${item.instructor.name}</td>
                        <td> ${item.sailors.size()}</td>
                        <td><a href="<c:url value = "/course/edit/${item.id}"/>">EDYTUJ</a></td>
                        <td><a href="<c:url value = "/course/delete/${item.id}"/>">USUŃ</a></td>

                    </tr>
                    <tr>
                        <td colspan="7" class="hiddenRow">
                            <div class="accordian-body collapse mx-auto" id="${i.index}">
                                <table class="white">
                                    <c:forEach items="${item.sailors}" var="sailorCourse" varStatus="j">
                                        <tr>
                                            <td>${j.index+1}</td>
                                            <td>${sailorCourse.sailor.name}</td>
                                            <td>${2019-sailorCourse.sailor.yearOfBirth} lat</td>
                                            <td><fmt:formatDate value='${sailorCourse.entryDate}'
                                                                pattern='dd-MM-yyyy'/></td>
                                            <td><c:choose>
                                                <c:when test="${sailorCourse.confirmed}">
                                                    <span class="bold">POTWIERDZONY</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value = "/sailor/confirm/${sailorCourse.id}"/>">POTWIERDŹ</a>
                                                </c:otherwise>
                                            </c:choose></td>
                                            <td>${sailorCourse.paid}</td>
                                            <td>
                                                <a href="<c:url value = "/sailor/delete/${sailorCourse.id}"/>">USUŃ</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</section>

<script type="text/javascript">
    $('.accordian-body').on('show.bs.collapse', function () {
        $(this).closest("table")
            .find(".collapse.in")
            .not(this)
            .collapse('toggle')
    })

</script>


</body>
</html>
