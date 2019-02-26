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
        <div class="text-center">
            <p>Zarejestruj się:</p>
            <div class="mx-auto">
                <div class="bluebox">
                    <div id="i"><i class="fas fa-info-circle "></i></div>
                    <span class="d-block text-justify" id="i_span"><small>Uprzejmie prosimy, aby <span class="darkblue">konto w serwisie było założone przez osobę pełnoletnią - rodzica lub opiekuna</span> młodego żeglarza.
                    Dane kontaktowe są nam niezbędne ze względów regulaminowych oraz bezpieczeństwa dzieci na kursie i będą wykorzystywanie wyłącznie w tym celu zgodnie
                    z (art. 6 ust. 1) Rozporządzenia RODO.</small></span>
                </div>
            </div>
        </div>
        <br>

        <div class="row">
            <div class="mx-auto">
                <form:form modelAttribute="user" method="post">
                    <div class="form-group row">
                        <label class="control-label col-sm-5">Imię i nazwisko:</label>
                        <div class="col-sm-7">
                            <form:input path="name" type="text" class="form-control"/>
                            <small><form:errors path="name" cssClass="error col-sm-offset-5 col-sm-12"
                                                element="div"/></small>
                        </div>

                    </div>

                    <div class="form-group row">
                        <label class="control-label col-sm-5">Email:</label>
                        <div class="col-sm-7">
                            <form:input path="email" type="email" class="form-control"/>
                            <small><form:errors path="email" cssClass="error col-sm-offset-9 col-sm-10"
                                                element="div"/></small>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5">Hasło:</label>
                        <div class="col-sm-7">
                            <form:input path="password" type="password" class="form-control"/>
                            <small><form:errors path="password" cssClass="error col-sm-offset-9 col-sm-10"
                                                element="div"/></small>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5">Powtórz hasło:</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="repeatPassword"/>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5">Numer telefonu:</label>
                        <div class="col-sm-7">
                            <form:input path="phone" type="text" class="form-control"/>
                            <small><form:errors path="phone" cssClass="error col-sm-offset-9 col-sm-10"
                                                element="div"/></small>
                        </div>

                    </div>
                    <div class="row">
                        <div class="mx-auto">
                            <input type="submit" class="myButton" value="ZAREJESTRUJ"/>
                        </div>
                    </div>
                    <div class="text-center">
                        <small>Klikając zarejestruj, akceptujesz <a href="/regulamin" rel="noopener noreferrer"
                                                                    target="_blank">Regulamin </a></small>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
