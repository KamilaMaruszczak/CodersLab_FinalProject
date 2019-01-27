<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 15.01.19
  Time: 18:16
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
<div class="mx-auto">

    <div class="border box">
        <div class="mx-auto">

            <div class="text-center"><p>Zaloguj się:</p><br></div>

            <div class="row">
                <div class="mx-auto">
                    <form method="post">
                        <div class="form-group row">
                            <label class="control-label col-sm-2">Email:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-2">Hasło:</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password">
                            </div>
                        </div>

                        <div class="form-group row center">
                            <div class="col-sm-offset-5 col-sm-12">
                                <div class="error">
                                    ${error}
                                </div>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <div class="mx-auto">
                                <button type="submit" class="myButton">ZALOGUJ</button>
                                <div class="margin-top text-center"><a href="/user/register"> Zarejestruj</a></div>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>

    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
