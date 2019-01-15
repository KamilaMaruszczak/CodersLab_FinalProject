<%--
  Created by IntelliJ IDEA.
  User: kamila
  Date: 15.01.19
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/views/taglib.jsp" %>
<html>
<%@ include file="/WEB-INF/views/head.jsp" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<body>
<section>
    <div class="border box">
        Dodaj kurs:
        <form:form modelAttribute="course" method="post" class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2">Instruktor:</label>
                <div class="col-sm-10">
                    <form:input path="instructorName" class="form-control" placeholder="Podaj instruktora"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </div>
        </form:form>
    </div>
</section>
</body>
</html>
