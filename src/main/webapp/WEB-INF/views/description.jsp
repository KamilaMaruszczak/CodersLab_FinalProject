<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 18.01.19
  Time: 09:55
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
<c:choose>
    <c:when test="${instructor}">

        <%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>

    </c:when>
</c:choose>

<section>


    <div class="border box">
        <div class="mx-auto my-4">
            <div class="row">
                <div class="d-inline-block float-sm-left width300 text-center align-middle"><img
                        src="/fragments/images/optymist.png"></div>
                <div class="d-inline-block width400 text-justify">
                    <p class="text-center">OPTYMIST</p>
                    Najmniejsza międzynarodowa klasa jachtów, przeznaczona dla dzieci, jako pierwszy stopień szkolenia
                    żeglarskiego. Jest to
                    łódka regatowa, bardzo prosta w obsłudze i zapewniająca duże bezpieczeństwo na wodzie. Pomimo
                    prostej konstrukcji daje szansę na poznanie
                    tajników żeglarstwa zarówno podstawowego, jak i regatowego. Opanowane na tej łódce podstawy
                    sterowania i pracy żaglem są takie same na wszystkich kolejnych łódkach,
                    aż do wielkich żaglowców włącznie.
                    <div class="text-center margin-top"><a href="/" class="myButton">ZOBACZ TERMINY</a></div>
                </div>
            </div>
            <div class="mx-auto my-4">
                <div class="row margin-top">
                    <div class="d-inline-block float-left width300 text-center">
                        <img src="/fragments/images/europa.png">
                    </div>
                    <div class="d-inline-block width400 text-justify">
                        <p class="text-center">EUROPA</p>
                        Jednoosobowa klasa łodzi żaglowej. W latach 1992-2004 klasa olimpijska dla kobiet.
                        Bardzo zaawansowana jeżeli chodzi o rozwiązania techniczne i regulacje. Wymaga zgłębienia wielu
                        tajników trymowania i ustawienia łódki. Łódka bardzo
                        szybka, zwrotna, dająca wielką radość podczas żeglowania już nawet przy średnich wiatrach. Po
                        opanowaniu wstępnych umiejętności żeglarskich na Optymiście,
                        Europa jest kolejnym krokiem rozwijania i doskonalenia żeglowania regatowego.

                        <div class="text-center margin-top"><a href="/" class="myButton">ZOBACZ TERMINY</a></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
