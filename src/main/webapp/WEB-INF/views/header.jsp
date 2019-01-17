<header class="page-header">
    <nav class="navbar navbar-expand-lg justify-content-around">
        <a href="/" class="navbar-brand main-logo">
            Lubelska Grupa Regatowa
        </a>
        <ul class="nav text-uppercase">
            <li class="nav-item active">
                <a class="nav-link disabled" href="/kursy">Kursy</a>
            </li>
            <li>
                <c:choose>
                    <c:when test="${name==null}">
                        <a class="nav-link color-header" href="/user/login">logowanie</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link color-header" href="/user/login">wyloguj</a>
                    </c:otherwise>
                </c:choose>
            </li>
            <c:choose>
                <c:when test="${name==null}">
                    <li>
                        <a class="nav-link color-header" href="/user/register">rejestracja</a>
                    </li>
                </c:when>
            </c:choose>

            <li>
                <a class="nav-link disabled" href="/kontakt">Kontakt</a>
            </li>
            <li>

            </li>
        </ul>
        <div>
            <div id="loggedUser" class="circle-div text-center icon-user"><i class="fa fa-anchor"></i>
                <span class="margin-left">${name}</span></div>
        </div>
    </nav>
</header>
