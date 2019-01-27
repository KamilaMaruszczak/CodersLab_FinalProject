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
                <div class="d-inline-block float-sm-left width300 text-center"><img
                        src="/fragments/images/optymist.png"></div>
                <div class="d-inline-block width400 justify">
                    <p class="text-center">OPTYMIST</p>
                    Najmniejsza międzynarodowa klasa jachtów, przeznaczona dla dzieci i młodzieży do 15 lat. Jest to
                    łódka regatowa (nie należy do najwygodniejszych). Jej kokpit zajmuje połowę jachtu. Łódka wykonana
                    jest zazwyczaj z włókna szklanego, choć zdarzają się drewniane kadłuby. dkfjhnsd;ufhns
                    dfsdkfjslnvx
                    sdlvjklvm
                    dxlnvvfclnfpbojfb;f[so
                </div>
            </div>
            <div class="mx-auto my-4">
                <div class="row margin-top">
                    <div class="d-inline-block float-left width300 text-center">
                        <img src="/fragments/images/europa.png">
                    </div>
                    <div class="d-inline-block width400 justify">
                        <p class="text-center">EUROPA</p>
                        Jednoosobowa klasa łodzi żaglowej. Zaprojektowana w roku 1960, jako jeden z typów łodzi
                        spełniających przepisy klasy Moth, dlatego była początkowo znana jako "Moth-Europe".
                        Konstruktor: Alois Roland (Belgia). W latach 1992-2004 klasa olimpijska dla kobiet.


                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>