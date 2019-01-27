<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 25.01.19
  Time: 21:17
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


<div class="border box">
    <div class="row">

        <div class="mapouter float-left">
            <div class="gmap_canvas">
                <%--<iframe id="gmap_canvas"--%>
                <%--src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4981.076946810055!2d23.032940238159814!3d51.38790202038162!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNTHCsDIzJzE2LjUiTiAyM8KwMDInMTQuNCJF!5e0!3m2!1spl!2spl!4v1548447773622&maptype=satellite"--%>
                <%--width="400" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"--%>
                <%--style="border:0" allowfullscreen></iframe>--%>
                <div style="width: 400px">
                    <iframe width="400" height="400"
                            src="https://maps.google.com/maps?width=400&amp;height=400&amp;hl=en&amp;q=Lubelska%20Grupa%20Regatowa+(Lubelska%20Grupa%20Regatowa)&amp;ie=UTF8&amp;t=k&amp;z=15&amp;iwloc=B&amp;output=embed"
                            frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a
                            href="https://www.maps.ie/map-my-route/">Create a route on google maps</a></iframe>
                </div>
                <br/>
                <a href="https://www.pureblack.de/wordpress-agentur/"></a></div>

        </div>
        <div class="d-inline-block width300 marginL">

            <span class="font20 bolder">Lubelska Grupa Regatowa </span> <br>
            Jezioro Piaseczno <br>
            Rozpłucie Pierwsze 10b <br>
            21-075 Ludwin <br><br>


            <span class="font20"><i class="fab fa-facebook-square"></i></span><a
                href="https://www.facebook.com/LubelskaGrupaRegatowa/" rel="noopener noreferrer" target="_blank">
            Lubelska
            Grupa Regatowa</a><br>
            <span class="font20"><i class="fa fa-phone-square"></i></span> 501-349-412 <br>
            <span class="font20"><i class="fa fa-envelope-square"></i></span> lubelskagruparegatowa@gmail.com
            <span class="font20"> <i class="fas fa-map-marker-alt"></i></span><a href="https://goo.gl/maps/5SBFZ3HkuYt"
                                                                                 rel="noopener noreferrer"
                                                                                 target="_blank"> 51°23'16.8"N
            23°02'14.6"E</a> <br><br>

        </div>

    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
