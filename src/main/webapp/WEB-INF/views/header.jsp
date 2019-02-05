<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<header class="page-header">
    <nav class="navbar navbar-expand-lg justify-content-around">
        <div class="d-none d-md-block">
            <a href="/" class="navbar-brand main-logo">
                Lubelska Grupa Regatowa
            </a>
        </div>
        <div class="d-md-none">
            <a href="/" class="navbar-brand main-logo">
                LGR
            </a>
        </div>
        <ul class="nav text-uppercase">
            <li class="nav-item active">
                <a class="nav-link" href="/description">Kursy</a>
            </li>
            <li>
                <a class="nav-link" href="/faq">FAQ</a>
            </li>
            <li>
                <a class="nav-link" href="/contact">Kontakt</a>
            </li>
            <c:choose>
                <c:when test="${name==null}">
                    <li>
                        <a class="nav-link color-header" href="/user/register">rejestracja</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <a class="nav-link color-header" href="/user/courses">moje zapisy</a>
                </c:otherwise>
            </c:choose>

            <li>
                <c:choose>
                    <c:when test="${name==null}">
                        <a class="nav-link color-header " href="/user/login">logowanie</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link color-header" href="/user/logout">wyloguj</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
        <div>
            <div id="loggedUser" class="circle-div text-center icon-user"><i class="fa fa-anchor"></i>
                <span class="margin-left charonman">${name}</span></div>
        </div>
    </nav>
</header>
