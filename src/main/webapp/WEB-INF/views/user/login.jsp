<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 15.01.19
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/views/taglib.jsp" %>
<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<section>
    ${error}
    <div class="border box">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="email" placeholder="Enter email">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label><input type="checkbox">Remember me</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Zaloguj</button>
                </div>
            </div>
        </form>
        <a href="/user/register">Zarejestruj się jako nowy użytkownik</a>
    </div>
</section>
</body>
</html>
