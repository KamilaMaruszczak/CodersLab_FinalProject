<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="yyyy"/>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>


<section>


    <div class="border box">
        <div class="row">
            <div class="mx-auto my-4">
                <img class="img-fluid" alt="Responsive image" src="/fragments/images/kalendar.png">
            </div>
            <div>
                <a class="d-none d-md-block" href="<c:url value = "/course/print"/>" rel="noopener noreferrer"
                   target="_blank"><h5><i class="fa fa-print"></i></h5></a>

            </div>
        </div>
        <div class="my-4">
            <div class="table-responsive">
                <table id="courses" class="table table-fixed w-100 d-block d-md-table text-center align-middle">
                    <thead>
                    <tr>
                        <th scope="row" colspan="7" class="align-middle"><h3>Lista kursów żeglarskich ${year}</h3></th>
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
                        <tr class="table-active font-weight-bold accordion-toggle">
                            <td class="align-middle"><fmt:formatDate value='${item.startDate}'
                                                                     pattern='dd-MM-yyyy'/></td>
                            <td class="align-middle"><fmt:formatDate value='${item.endDate}' pattern='dd-MM-yyyy'/></td>
                            <td class="align-middle"> ${item.type}</td>
                            <td class="align-middle"> ${item.instructor.name}</td>
                            <td class="align-middle"> ${item.sailors.size()}</td>

                            <c:if test="${admin}">
                                <td class="align-middle"><a href="<c:url value = "/course/edit/${item.id}"/>">EDYTUJ</a>
                                </td>
                                <td class="align-middle">

                                    <a class="trigger" href="">USUŃ</a>
                                    <span class="hide tooltiptext">Tej operacji nie można cofnąć. Spowoduje ona usunięcie kursu i zapisanych kursantów.<br><span
                                            class="triggerhide">NIE USUWAJ</span> &nbsp; &nbsp; <a id="a_red"
                                                                                                   href="<c:url value = "/course/delete/${item.id}"/>">USUŃ</a></span>

                                </td>
                            </c:if>


                        </tr>
                        <tr>
                            <td colspan="7" class="hiddenRow">

                                    <div class="table-responsive">
                                        <table class="table width-inherit" id="sailors">
                                            <tr class="table-active">
                                                <td class="align-middle"></td>
                                                <td class="align-middle">Kursant</td>
                                                <td class="align-middle">Wiek</td>
                                                <td class="align-middle">Zapis</td>
                                                <td class="align-middle">Rodzic</td>
                                                <td class="align-middle">Potwierdzony</td>
                                                <td class="align-middle text-center">Wpłata</td>
                                                <c:if test="${admin}">
                                                    <td class="align-middle">
                                                        <span class="d-none d-md-block">Zapisz&nbsp;wpł.</span>
                                                        <span class="d-md-none">Zapisz&nbsp;wpłatę</span>
                                                    </td>
                                                    <td class="align-middle">Usuń</td>
                                                </c:if>


                                            </tr>

                                            <tbody>
                                            <c:forEach items="${item.sailors}" var="sailorCourse" varStatus="j">
                                                <tr class="">
                                                    <td class="align-middle pa">${j.index+1}</td>
                                                    <td class="align-middle">${sailorCourse.sailor.name}</td>
                                                    <td class="align-middle"><c:out
                                                            value="${year - sailorCourse.sailor.yearOfBirth}"/> lat
                                                    </td>
                                                    <td class="align-middle"><fmt:formatDate
                                                            value='${sailorCourse.entryDate}'
                                                            pattern='dd-MM-yyyy'/></td>
                                                    <td class="align-middle text-center"><i
                                                            class="far fa-address-card blue ismall"></i>
                                                    </td>
                                                    <td class="align-middle">
                                                        <c:choose>
                                                            <c:when test="${sailorCourse.confirmed}">
                                                                <span class="bold">POTWIERDZONY </span>
                                                            </c:when>
                                                            <c:otherwise>

                                                                <c:if test="${admin}">
                                                                    <a href="<c:url value = "/sailor/confirm/${sailorCourse.id}"/>">POTWIERDŹ</a>
                                                                </c:if>

                                                            </c:otherwise>
                                                        </c:choose></td>
                                                    <td class="align-middle text-center">
                                                        <span class="bold">${sailorCourse.paid}</span></td>


                                                    <c:if test="${admin}">
                                                        <td class="align-middle text-center">
                                                            <form method="post"
                                                                  action="/sailor/payment/${sailorCourse.id}"
                                                                  class="align-middle">
                                                                    <%--<input type="hidden" name="sailorCourseId" value="${sailorCourse.id}">--%>
                                                                <div class="row form-group align-middle zeromargin margin-top">
                                                                    <input id="input" type="text" class="form-control"
                                                                           name="paid">
                                                                    <button id="button" type="submit"
                                                                            class="myButton paddingLR"><i
                                                                            class="far fa-check-square blue ismall"></i>
                                                                    </button>
                                                                        <%--<input type="submit" value="+"/>--%>
                                                                </div>
                                                            </form>
                                                        </td>
                                                        <td class="align-middle">

                                                            <a class="trigger" href="<c:url value = "/"/>">USUŃ</a>
                                                            <span class="hide tooltiptext">Tej operacji nie można cofnąć:<br><span
                                                                    class="triggerhide">NIE USUWAJ</span> &nbsp; &nbsp; <a
                                                                    id="a_red"
                                                                    href="<c:url value = "/sailor/delete/${sailorCourse.id}"/>">USUŃ</a></span>

                                                        </td>
                                                    </c:if>


                                                </tr>
                                                <tr class="hide table-info" id="parent">
                                                    <td colspan="9" class="text-center">
                                                        Rodzic: ${sailorCourse.sailor.user.name} &nbsp;
                                                        tel: ${sailorCourse.sailor.user.phone} &nbsp;
                                                        email: ${sailorCourse.sailor.user.email}
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
    </div>
</section>

<script type="text/javascript">
    $('tr.accordion-toggle').on('click', function () {
        $(this).next()
            .find(".hiddenRow")
            .toggleClass("hide");
    })

    var courses = $('#courses');
    courses.on("click", "i.far.fa-address-card", function () {
        $(this).parent().parent().next("#parent")
            .toggle();

    })

    courses.find("a.trigger").bind("click", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $(this).next("span.tooltiptext")
            .toggleClass("hide");

    })

    courses.find("span.triggerhide").bind("click", function (event) {
        event.preventDefault();
        $(this).parent()
            .toggleClass("hide");

    })


</script>


</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
