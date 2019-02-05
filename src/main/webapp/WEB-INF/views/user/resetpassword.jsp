<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 01.02.19
  Time: 19:51
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
            <p>Reset hasła:</p>

        </div>
        <br>
        <form method="post">
            <div class="form-group row flex-nowrap">
                <label class="control-label col-sm-5">Konto:</label>
                <div class="col-sm-10 bold">
                    ${user.email}
                </div>
            </div>
            <div class="form-group row flex-nowrap">
                <label class="control-label col-sm-5">Hasło:</label>
                <div class="col-sm-7">
                    <input path="password" type="password" class="form-control" name="password"/>
                </div>
            </div>
            <div class="form-group row flex-nowrap ">
                <label class="control-label col-sm-5">Powtórz hasło:</label>
                <div class="col-sm-7">
                    <input type="password" class="form-control" name="repeatPassword"/>
                </div>
                <br>
            </div>
            <div class="form-group row flex-nowrap ">
                <label class="control-label col-sm-5"></label>
                <div class="col-sm-7">
                    <small class="error">${error}</small>
                </div>
                <br>
            </div>
            <div class="row flex-nowrap">
                <div class="mx-auto">
                    <a href="/user/all" class="myButton">ANULUJ</a>
                    <input type="submit" class="myButton" value="ZRESETUJ HASŁO"/>
                </div>
            </div>
        </form>
    </div>
</section>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>

