<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 16.01.19
  Time: 16:04
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
<div class="border box">
    <div class="text-center"><p>Zapisujesz na kurs:</p><br></div>

    <table class="paleBlueRows">
        <thead>

        <tr>
            <th>Data rozpoczęcia</th>
            <th>Data zakończenia</th>
            <th>Klasa</th>
            <th>Instruktor</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><fmt:formatDate value='${course.startDate}' pattern='dd-MM-yyyy'/></td>
            <td><fmt:formatDate value='${course.endDate}' pattern='dd-MM-yyyy'/></td>
            <td> ${course.type}</td>
            <td> ${course.instructor.name}</td>
        </tr>


        </tbody>
    </table>

    <div class="row margin-top">
        <div class="mx-auto">

            <form:form modelAttribute="sailor" method="post" class="mx-auto"
                       action="/user/course-confirm/existing/${course.id}">

                <div>
                    <label>Żeglarz:</label>
                    <div>
                        <form:select path="id">
                            <form:options items="${userSailors}" itemValue="id" itemLabel="name"/>
                        </form:select>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="mx-auto">
                        <input type="submit" class="myButton" value="ZAPISZ"/>
                    </div>
                </div>
            </form:form>


            <form:form modelAttribute="sailor" method="post" class="mx-auto"
                       action="/user/course-confirm/new/${course.id}">
                <div class="form-group row">
                    <label class="control-label col-sm-10">Imię i nazwisko żeglarza:</label>
                    <div class="col-sm-10">
                        <form:input path="name" class="form-control" placeholder=""/>
                        <form:errors path="name" cssClass="error"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-10">Rok urodzenia:</label>
                    <div class="col-sm-10">
                        <form:input path="yearOfBirth" class="form-control" placeholder=""/>
                        <form:errors path="yearOfBirth" cssClass="error"/>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="mx-auto">
                        <input type="submit" class="myButton" value="ZAPISZ"/>
                        <a href="/">
                            <button class="myButton">ZREZYGNUJ</button>
                        </a>
                    </div>
                </div>
            </form:form>

        </div>
    </div>
</div>
</body>
</html>
