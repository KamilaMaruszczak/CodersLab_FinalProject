<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 11.01.19
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<section>
    <div class="border box">
        <div class="text-center">
            <p>Edycja danych:</p>
        </div>
        <br>

        <div class="row">
            <div class="mx-auto">
                <form:form modelAttribute="user" method="post" action="/user/edit/${user.id}">
                    <div class="form-group row flex-nowrap">
                        <label class="control-label col-sm-5">Email:</label>
                        <div class="col-sm-10 bold">
                                ${user.email}
                        </div>
                        <form:errors path="name" cssClass="error col-sm-offset-9 col-sm-10" element="div"/>
                    </div>
                    <div class="form-group row flex-nowrap">
                        <label class="control-label col-sm-5">Imię i nazwisko:</label>
                        <div class="col-sm-7">
                            <form:input path="name" type="text" class="form-control" name="name"/>
                        </div>
                        <form:errors path="name" cssClass="error col-sm-offset-9 col-sm-10" element="div"/>
                    </div>
                    <div class="form-group row flex-nowrap">
                        <label class="control-label col-sm-5">Numer telefonu:</label>
                        <div class="col-sm-7">
                            <form:input path="phone" type="text" class="form-control" name="phone"/>
                        </div>
                        <form:errors path="phone" cssClass="error col-sm-offset-9 col-sm-10" element="div"/>
                    </div>
                    <div class="form-group row flex-nowrap">
                        <label class="control-label col-sm-5">Hasło:</label>
                        <div class="col-sm-7">
                            <a href="<c:url value = "/user/resetpassword/${user.id}"/>">Zresetuj Hasło</a>
                        </div>
                    </div>
                    <div class="form-group row flex-nowrap">
                        <label class="control-label col-sm-5">Instruktor:</label>
                        <div class="col-sm-2">
                            <form:checkbox path="instructor" name="instructor"/>
                        </div>
                    </div>
                    <div class="form-group row flex-nowrap">
                        <label class="control-label col-sm-5">Admin:</label>
                        <div class="col-sm-2">
                            <form:checkbox path="admin" name="admin"/>
                        </div>
                    </div>
                    <div class="row flex-nowrap">
                        <div class="mx-auto">
                            <a href="/user/all" class="myButton">ANULUJ</a>
                            <input type="submit" class="myButton" value="ZAPISZ"/>
                        </div>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</section>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>

