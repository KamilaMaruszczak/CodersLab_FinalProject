<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <title>Do druku</title>
</head>

<body>
<div class="table-responsive">
    <table id="courses" class="table table-bordered d-block d-md-table text-center align-middle">
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


        </tr>

        </thead>
        <tbody>
        <c:forEach items="${courses}" var="item" varStatus="i">
            <tr data-toggle="collapse" data-target="#${i.index}"
                class="table-secondary font-weight-bold accordion-toggle ">
                <td class="align-middle"><fmt:formatDate value='${item.startDate}'
                                                         pattern='dd-MM-yyyy'/></td>
                <td class="align-middle"><fmt:formatDate value='${item.endDate}' pattern='dd-MM-yyyy'/></td>
                <td class="align-middle"> ${item.type}</td>
                <td class="align-middle"> ${item.instructor.name}</td>
                <td class="align-middle"> ${item.sailors.size()}</td>


            </tr>
            <tr>
                <td colspan="7" class="hiddenRow">
                    <div data-role="collapsible" class="mx-auto width-inherit" id="${i.index}"
                         data-collapsed="false">
                        <div class="table-responsive">
                            <table class="table width-inherit">


                                <tbody>
                                <c:forEach items="${item.sailors}" var="sailorCourse" varStatus="j">
                                    <tr class="">
                                        <td style="width:2%" class="align-middle pa">${j.index+1}</td>
                                        <td style="width:30%" class="align-middle">${sailorCourse.sailor.name}</td>
                                        <td style="width:10%"
                                            class="align-middle">${2019-sailorCourse.sailor.yearOfBirth} lat
                                        </td>
                                        <td style="width:28%" class="align-middle">
                                            Opiekun: ${sailorCourse.sailor.user.phone} </td>

                                        <td style="width:20%" class="align-middle">
                                            <c:choose>
                                                <c:when test="${sailorCourse.confirmed}">
                                                    <span class="bold">POTWIERDZONY </span>
                                                </c:when>
                                            </c:choose></td>

                                    </tr>


                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<script type="text/javascript">
    $('.accordion-toggle').on('hide.bs.collapse', function () {
        $(this).closest("table")
            .find(".collapsible")
            .collapse('toggle')
    })

    var courses = $('#courses');
    courses.on("click", "i.far.fa-address-card", function () {
        $(this).parent().parent().next("#parent")
            .toggle();

    })


</script>


</body>

</html>
