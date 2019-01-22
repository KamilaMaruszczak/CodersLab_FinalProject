<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 15.01.19
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="pl-PL">
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<body>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<section>
    <div class="border box">
        <p>${type} kurs:</p><br>
        <form:form modelAttribute="course" method="post" class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2">Instruktor:</label>
                <div class="col-sm-10">
                    <form:select path="instructor">
                        <form:options items="${instructor}" itemValue="id" itemLabel="name"/>
                    </form:select>
                    <form:errors path="instructor" cssClass="error"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Rodzaj kursu</label>
                <div class="col-sm-10">
                    <form:select path="type" items="${coursesType}" class="form-control"/>
                    <form:errors path="type" cssClass="error"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Początek kursu</label>
                <div class="col-sm-10">
                    <form:input type="date" path="startDate" class="form-control" placeholder="YYYY-MM_DD"/>
                    <form:errors path="startDate" cssClass="error"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Koniec kursu:</label>
                <div class="col-sm-10">
                    <form:input type="date" path="endDate" class="form-control" placeholder="YYYY-MM-DD"/>
                    <form:errors path="endDate" cssClass="error"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2">Liczba dostępnych łódek:</label>
                <div class="col-sm-10">
                    <form:input path="numberOfBoats" class="form-control" placeholder="Podaj liczbę łódek"/>
                    <form:errors path="numberOfBoats" cssClass="error"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" value="ZAPISZ KURS"/>
                </div>
            </div>
        </form:form>
    </div>
</section>
</body>
</html>
