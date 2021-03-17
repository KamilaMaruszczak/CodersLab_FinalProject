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
            <div>
                <h3 class=""><i class="fas fa-clipboard-list"></i> KURSY:</h3>
            </div>
            <div class="row">
                <div class="d-inline-block float-sm-left width350 text-center align-middle"><img
                        src="/fragments/images/optymist.png"></div>
                <div class="d-inline-block width420 text-justify">
                    <p class="text-center">OPTYMIST</p>
                    Najmniejsza międzynarodowa klasa jachtów, przeznaczona dla dzieci, jako pierwszy stopień szkolenia
                    żeglarskiego. Jest to
                    łódka regatowa, bardzo prosta w obsłudze i zapewniająca duże bezpieczeństwo na wodzie. Pomimo
                    prostej konstrukcji daje szansę na poznanie
                    tajników żeglarstwa zarówno podstawowego, jak i regatowego. Opanowane na tej łódce podstawy
                    sterowania i pracy żaglem są takie same na wszystkich kolejnych łódkach,
                    aż do wielkich żaglowców włącznie.
                    <br><br>
                    <b>Dla kogo:</b> szkolenia na Optymistach zaczynamy od 7 roku życia i prowadzimy do około 150 cm
                    wzrostu :)
                    wymagana jest samodzielność, umiejetność pływania wpław i brak lęku przed wpadnięciem do wody


                    <div class="text-center margin-top"><a href="/" class="myButton">ZOBACZ TERMINY</a></div>
                </div>
            </div>
            <div class="mx-auto my-4">
                <div class="row margin-top">
                    <div class="d-inline-block float-left width350 text-center">
                        <img src="/fragments/images/europa.png">
                    </div>
                    <div class="d-inline-block width420 text-justify">
                        <p class="text-center">EUROPA</p>
                        Jednoosobowa klasa łodzi żaglowej. W latach 1992-2004 klasa olimpijska dla kobiet.
                        Bardzo zaawansowana jeżeli chodzi o rozwiązania techniczne i regulacje. Wymaga zgłębienia wielu
                        tajników trymowania i ustawienia łódki. Jest bardzo
                        szybka, zwrotna i daje wielką radość podczas żeglowania już nawet przy średnich wiatrach. Po
                        opanowaniu wstępnych umiejętności żeglarskich na Optymiście,
                        Europa jest kolejnym krokiem rozwijania i doskonalenia żeglowania regatowego.
                        <br><br>
                        <b>Dla kogo:</b> preferowana grupa wiekowa, to młodzież od 14 roku życia,
                        minimalna waga 50kg, wskazane jest wcześniejsze doświadczenie żeglarskie z uwagi na
                        szybkość łódki i skomplikowanie techniczne

                        <div class="text-center margin-top"><a href="/" class="myButton">ZOBACZ TERMINY</a></div>

                    </div>
                </div>
            </div>
            <div class="mx-auto my-4">
                <div class="row margin-top">
                    <div class="d-inline-block float-left width350 text-center">
                        <img src="/fragments/images/korsar.jpg">
                    </div>
                    <div class="d-inline-block width420 text-justify">
                        <p class="text-center">KORSARZ</p>
                        Dwuosobowa klasa regatowo - turystyczna, jacht żaglowy popularny w Niemczech, Austrii,
                        Szwajcarii oraz Polsce.
                        Dzięki niewielkiej powierzchni zanurzenia i sporej powierzchni ożaglowania, Korsarz bardzo łatwo
                        i przy niewielkim wietrze wchodzi w tzw. ślizg. Do dyspozycji zalogi są 3 żagle: grot, fok i
                        spinaker,
                        o łacznej powierzchni około 28m kwadratowych.
                        Idealna waga zespołu żeglarskiego wynosi od 100 do 160 kg. Korsarz posiada pasy balastowe oraz
                        trapez ułatwiające prowadzenie łodzi osobom lżejszym oraz ułatwiające prowadzenie jachtu przy
                        silnych wiatrach.
                        <br><br>
                        <b>Dla kogo:</b> oferta skierowana dla młodzieży i osób starszych. Z uwagi na rozwijaną predkość
                        oraz dużą ilość elementów technicznych niezbednych
                        do żeglowania, przynajmniej jedna osoba w łódce (sternik) musi posiadać doświadczenie
                        żeglarskie.
                        Załoga może dopiero rozpoczynać swoją przygodę z żeglarstwem.

                        <div class="text-center margin-top"><a href="/" class="myButton">ZOBACZ TERMINY</a></div>

                    </div>
                </div>
            </div>
            <div class="mx-auto">
                <div class="bluebox2">
                    Jeżeli nie wiesz jaki kurs wybrać, lub masz więcej pytań, zajrzyj do sekcji <a
                        href="<c:url value = "/faq"/>">"Często zadawane pytania"</a>.
                </div>
            </div>
            <div class="mx-auto" style="padding-top: 2rem">
                <div>
                    <h3 class=""><i class="fas fa-clipboard-list"></i> PROGRAM KURSU:</h3>
                </div>
                <ol>
                    <li>Umiejętności teoretyczne:</li>
                    <ul>
                        <li>budowa jachtu, nazewnictwo niezbędne do prawidłowej obsługi łódki w poszczególnych klasach
                        </li>
                        <li>nauka i doskonalenie umiejętności rozpoznawania siły i kierunku wiatru</li>
                        <li>kursy względem wiatru</li>
                        <li>teoria żeglowania, w zakresie niezbędnym do zrozumienia dlaczego łódka płynie, zakres wiedzy
                            zależny od grupy wiekowej i klasy jachtu
                        </li>
                        <li>teoria manewrowania, w zakresie niezbędnym do wykonania zwrotów przez sztag i rufę oraz
                            manewrów wyjścia i powrotu do portu
                        </li>
                        <li>przepisy bezpieczeństwa oraz przepisy regatowe w zakresie niezbędnym do bezpiecznego i
                            skutecznego żeglowania w trakcie regat i podczas pływania turystycznego
                        </li>
                    </ul>
                    <li>Prace bosmańskie:</li>
                    <ul>
                        <li>wiadomości o linach</li>
                        <li>nauka i doskonalenie wiązania węzłów, niezbędnych do prawidłowego funkcjonowania łódki</li>
                        <li>drobne prace naprawczo-konserwujące niezbędne do właściwej dbałości o sprzęt</li>
                    </ul>
                    <li>Umiejętności praktyczne:</li>
                    <ul>
                        <li>nauka i doskonalenie przygotowania łódki do zejścia na wodę (taklowanie i roztaklowanie
                            jachtu)
                        </li>
                        <li>nauka i doskonalenie bezpiecznego i skutecznego zejścia na wodę</li>
                        <li>nauka i doskonalenie zachowania się podczas wywrotki jachtu</li>
                        <li>nauka i doskonalenie sterowania na kurs</li>
                        <li>nauka i doskonalenie pracy żaglem (luzowanie i wybieranie żagla w zależności od kursu
                            względem wiatru)
                        </li>
                        <li> nauka i doskonalenie zwrotu przez sztag i rufę</li>
                        <li>nauka i doskonalenie balastowania (w przypadku klasy Korsarz nauka obsługi trapezu)</li>
                        <li>w przypadku klasy Korsarz nauka i doskonalenie współpracy poszczególnych żagli, obsługa
                            spinakera
                        </li>
                    </ul>
                    <li>Umiejętności regatowe:</li>
                    <ul>
                        <li>nauka i doskonalenie prawidłowego opłynięcia trasy regatowej</li>
                        <li>procedura startowa - jak prawidłowo i skutecznie wystartować</li>
                        <li>wykorzystanie przepisów regatowych w praktyce do bezpiecznego i skutecznego żeglowania</li>
                    </ul>
                </ol>
            </div>
        </div>
    </div>
</section>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
