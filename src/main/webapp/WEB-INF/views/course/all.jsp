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
            <table id="courses" class="table text-center align-middle">
                <thead>
                <tr>
                    <th scope="row" colspan="7"><h3>Lista kursów żeglarskich 2019</h3></th>
                </tr>
                <tr>
                    <th>Data rozpoczęcia</th>
                    <th>Data zakończenia</th>
                    <th>Klasa</th>
                    <th>Instruktor</th>
                    <th>Ilość zapisów</th>
                    <th>Edytuj</th>
                    <th>Usuń</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${courses}" var="item" varStatus="i">
                    <tr data-toggle="collapse" data-target="#${i.index}"
                        class="table-active font-weight-bold accordion-toggle ">
                        <td class="align-middle"><fmt:formatDate value='${item.startDate}' pattern='dd-MM-yyyy'/></td>
                        <td class="align-middle"><fmt:formatDate value='${item.endDate}' pattern='dd-MM-yyyy'/></td>
                        <td class="align-middle"> ${item.type}</td>
                        <td class="align-middle"> ${item.instructor.name}</td>
                        <td class="align-middle"> ${item.sailors.size()}</td>
                        <td class="align-middle"><a href="<c:url value = "/course/edit/${item.id}"/>">EDYTUJ</a></td>
                        <td class="align-middle"><a href="<c:url value = "/course/delete/${item.id}"/>">USUŃ</a></td>

                    </tr>
                    <tr>
                        <td colspan="7" class="hiddenRow">
                            <div class="accordian-body collapse mx-auto width-inherit" id="${i.index}">
                                <table class="table">
                                    <tr class="table-active">
                                        <td class="align-middle"></td>
                                        <td class="align-middle">Kursant</td>
                                        <td class="align-middle">Wiek</td>
                                        <td class="align-middle">Zapis</td>
                                        <td class="align-middle">Rodzic</td>
                                        <td class="align-middle">Potwierdzony</td>
                                        <td class="align-middle">Usuń</td>
                                        <td class="align-middle">Wpłata</td>

                                    </tr>

                                    <tbody>
                                    <c:forEach items="${item.sailors}" var="sailorCourse" varStatus="j">
                                        <tr>
                                            <td class="align-middle">${j.index+1}</td>
                                            <td class="align-middle">${sailorCourse.sailor.name}</td>
                                            <td class="align-middle">${2019-sailorCourse.sailor.yearOfBirth} lat</td>
                                            <td class="align-middle"><fmt:formatDate value='${sailorCourse.entryDate}'
                                                                pattern='dd-MM-yyyy'/></td>
                                            <td class="align-middle"><a
                                                    href="<c:url value = "/user"/>">${sailorCourse.sailor.user.name}</a>
                                            </td>
                                            <td class="align-middle"><c:choose>
                                                <c:when test="${sailorCourse.confirmed}">
                                                    <span class="bold">POTWIERDZONY</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="<c:url value = "/sailor/confirm/${sailorCourse.id}"/>">POTWIERDŹ</a>
                                                </c:otherwise>
                                            </c:choose></td>
                                            <td class="align-middle">
                                                <a href="<c:url value = "/sailor/delete/${sailorCourse.id}"/>">USUŃ</a>
                                            </td>
                                            <td class="align-middle">${sailorCourse.paid}</td>


                                        </tr>
                                    </c:forEach>
                                    </tbody>
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
    $('.accordian-body').on('hide.bs.collapse', function () {
        $(this).closest("table")
            .find(".collapse")
            .not(this)
            .collapse('toggle')
    })

</script>


</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
