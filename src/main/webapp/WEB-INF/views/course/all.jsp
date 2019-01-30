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
            <form method="POST" id="my_form"></form>
            <table id="courses" class="table text-center align-middle">
                <thead>
                <tr>
                    <th scope="row" colspan="7" class="align-middle"><h3>Lista kursów żeglarskich 2019</h3></th>
                </tr>
                <tr>
                    <th class="align-middle">Data rozpoczęcia</th>
                    <th class="align-middle">Data zakończenia</th>
                    <th class="align-middle">Klasa</th>
                    <th class="align-middle">Instruktor</th>
                    <th class="align-middle">Ilość zapisów</th>

                    <c:if test="${admin}">
                        <th class="align-middle">Edytuj</th>
                        <th class="align-middle">Usuń</th>
                    </c:if>

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

                        <c:if test="${admin}">
                            <td class="align-middle"><a href="<c:url value = "/course/edit/${item.id}"/>">EDYTUJ</a>
                            </td>
                            <td class="align-middle"><a href="<c:url value = "/course/delete/${item.id}"/>">USUŃ</a>
                            </td>
                        </c:if>


                    </tr>
                    <tr>
                        <td colspan="7" class="hiddenRow">
                            <div data-role="collapsible" class="mx-auto width-inherit" id="${i.index}"
                                 data-collapsed="false">
                                <table class="table width-inherit">
                                    <tr class="table-active">
                                        <td class="align-middle"></td>
                                        <td class="align-middle">Kursant</td>
                                        <td class="align-middle">Wiek</td>
                                        <td class="align-middle">Zapis</td>
                                        <td class="align-middle">Rodzic</td>
                                        <td class="align-middle">Potwierdzony</td>

                                        <c:if test="${admin}">
                                            <td class="align-middle">Usuń</td>
                                        </c:if>

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
                                            <td class="align-middle text-center"><i class="far fa-address-card"></i>
                                            </td>
                                            <td class="align-middle">
                                                <c:choose>
                                                    <c:when test="${sailorCourse.confirmed}">
                                                        <span class="bold">POTWIERDZONY</span>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <c:if test="${admin}">
                                                            <a href="<c:url value = "/sailor/confirm/${sailorCourse.id}"/>">POTWIERDŹ</a>
                                                        </c:if>

                                                    </c:otherwise>
                                                </c:choose></td>
                                            <c:if test="${admin}">
                                                <td class="align-middle">
                                                    <a href="<c:url value = "/sailor/delete/${sailorCourse.id}"/>">USUŃ</a>
                                                </td>
                                            </c:if>

                                            <td class="align-middle">


                                                    ${sailorCourse.paid}


                                                <c:if test="${admin}">
                                                    <%--<input type="text" name="company" form="my_form" />--%>
                                                    <%--<button type="button" form="my_form">ok</button>--%>
                                                    <div class="row form-group">
                                                        <div class="input-group">

                                                            <input type="text" class="form-control" form="my_form"
                                                                   name="paid">
                                                            <button type="submit" class="myButton item-right"><i
                                                                    class="fa fa-pencil-square"></i></button>

                                                                <%--<span class="input-group-addon success"><span class="glyphicon glyphicon-ok"></span></span>--%>
                                                        </div>
                                                    </div>
                                                </c:if>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" class="hiddenRow" id="parent">
                                                <div data-role="collapsible" class="mx-auto width-inherit"
                                                     id="${j.index}"
                                                     data-collapsed="true">
                                                        ${sailorCourse.sailor.user.name}


                                                </div>
                                            </td>
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
    $('.accordion-toggle').on('hide.bs.collapse', function () {
        $(this).closest("table")
            .find(".collapsible")
            .collapse('toggle')
    })

    var button = $('far fa-address-card');
    button.on("click", function () {
        $(this).closest("#parent")
            .collapse('toggle')

    })



</script>


</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
