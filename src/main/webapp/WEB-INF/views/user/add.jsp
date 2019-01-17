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
<section>
    <div class="border box">
        <div class="text-center"><p>Zarejestruj się:</p></div>
        <br>
        <div class="row">
            <div class="mx-auto">
                <form:form modelAttribute="user" method="post">
                    <div class="form-group row">
                        <label class="control-label col-sm-8">Imię i nazwisko:</label>
                        <div class="col-sm-12">
                            <form:input path="name" type="text" class="form-control"/>
                        </div>
                        <form:errors path="name" cssClass="error col-sm-offset-9 col-sm-10" element="div"/>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-8">Email:</label>
                        <div class="col-sm-12">
                            <form:input path="email" type="email" class="form-control"/>
                        </div>
                        <form:errors path="email" cssClass="error col-sm-offset-9 col-sm-10" element="div"/>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-8">Hasło:</label>
                        <div class="col-sm-12">
                            <form:input path="password" type="password" class="form-control"/>
                        </div>
                        <form:errors path="password" cssClass="error col-sm-offset-9 col-sm-10" element="div"/>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-8">Powtórz hasło:</label>
                        <div class="col-sm-12">
                            <input type="password" class="form-control" name="repeatPassword"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-8">Numer telefonu:</label>
                        <div class="col-sm-12">
                            <form:input path="phone" type="text" class="form-control"/>
                        </div>
                        <form:errors path="phone" cssClass="error col-sm-offset-9 col-sm-10" element="div"/>
                    </div>
                    <div class="form-group row">
                        <div class="mx-auto">
                            <input type="submit" class="myButton" value="ZAREJESTRUJ"/>
                        </div>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</section>
</body>
</html>
