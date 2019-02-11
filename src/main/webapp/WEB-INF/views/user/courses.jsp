<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 21.01.19
  Time: 15:41
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
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" pattern="yyyy"/>
<body>
<c:choose>
    <c:when test="${instructor}">

        <%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>

    </c:when>
</c:choose>


<div class="border box">
    <div class="text-center"><p>Moje zapisy ${year}:</p><br></div>
    <div class="table-responsive">
        <table class="table table-striped" id="sailors">
            <thead>
            <tr></tr>
            <tr>
                <th class="align-middle">Żeglarz</th>
                <th class="align-middle">Data rozpoczęcia</th>
                <th class="align-middle">Data zakończenia</th>
                <th class="align-middle">Klasa</th>
                <th class="align-middle">Instruktor</th>
                <th class="align-middle">Data Zapisu</th>
                <th class="align-middle">Usuń Zapis</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sailorCourseList}" var="sailorCourse">
                <tr>
                    <td class="align-middle">${sailorCourse.sailor.name}</td>
                    <td class="align-middle"><fmt:formatDate value='${sailorCourse.course.startDate}'
                                                             pattern='dd-MM-yyyy'/></td>
                    <td class="align-middle"><fmt:formatDate value='${sailorCourse.course.endDate}'
                                                             pattern='dd-MM-yyyy'/></td>
                    <td class="align-middle">${sailorCourse.course.type}</td>
                    <td class="align-middle">${sailorCourse.course.instructor.name}</td>
                    <td class="align-middle"><fmt:formatDate value='${sailorCourse.entryDate}'
                                                             pattern='dd-MM-yyyy'/></td>
                    <td class="align-middle">
                        <a class="trigger" href="">USUŃ</a>
                        <span class="hide tooltiptext">Tej operacji nie można cofnąć.<br><span
                                class="triggerhide">NIE USUWAJ</span> &nbsp; &nbsp; <a
                                id="a_red" href="<c:url value = "/sailor/delete/${sailorCourse.id}"/>">USUŃ</a></span>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:if test="${sailorCourseList.size()>0}">
        <div class="mx-auto">
            <div class="bluebox2">
                <div class="text-center">

                    <h3 class=""><i class="fas fa-info-circle "></i> Ważne informacje:</h3>
                </div>
                <div class="text-justify bold">Po dokonaniu zapisu prosimy o wpłatę zaliczki w przeciągu <span
                        class="darkblue">7 dni</span> w celu potwierdzenia chęci udziału w kursie.
                    Dopiero po otrzymaniu wpłaty rezerwacja zostanie potwierdzona. W przeciwnym wypadku zarezerwowane
                    miejsce zostanie zwolnione i zniknie z karty "Moje zapisy".
                </div>
                <br>
                <div class="text-justify bold">
                    <table class="bold white">
                        <tr>
                            <td align="right">Kwota zaliczki:</td>
                            <td><span class="darkblue">&nbsp; 200zł x ilość zarezerwowanych miejsc</span></td>
                        </tr>
                        <tr>
                            <td align="right">Nr konta:</td>
                            <td><span class="darkblue">&nbsp; 96 2030 0045 1110 0000 0348 2520</span></td>
                        </tr>
                        <tr>
                            <td align="right">Odbiorca:</td>
                            <td><span class="darkblue">&nbsp; Lubelska Grupa Regatowa</span></td>
                        </tr>
                        <tr>
                            <td align="right">Tytułem:</td>
                            <td><span class="darkblue">&nbsp; Imię i Nazwisko/a uczestnika/ów kursu</span></td>
                        </tr>
                    </table>
                    <br>
                    <div class="text-justify bold">Pozostałą kwotę: 500zł x ilość zarezerwowanych miejsc, należy wpłacić
                        na 7 dni przed datą rozpoczęcia
                        kursu.
                    </div>
                </div>
            </div>
        </div>
        <div class="mx-auto">
            <div class="bluebox2">
                Informacja o tym jak przygotować się do kursu znajduje się w sekcji <a href="<c:url value = "/faq"/>">"Często
                zadawane pytania"</a>.
            </div>
        </div>
    </c:if>
</div>

<script type="text/javascript">
    var sailors = $('#sailors');
    sailors.find("a.trigger").bind("click", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        $(this).next("span.tooltiptext")
            .toggleClass("hide");

    })

    sailors.find("span.triggerhide").bind("click", function (event) {
        event.preventDefault();
        $(this).parent()
            .toggleClass("hide");

    })


</script>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
