<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><spring:message code="user.table"/></title>
    <link href='<spring:url value="/css/light.css"/>' rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="templates/navbar.jsp"/>
<div class="container-md">
    <br/>
    <br/>
    <br/>
    <form id="deleteCityForm${city.id}" name="userManagementForm" enctype="text/plain">
        <input id="currentUserId" hidden name="currentUserId" value="${currentUser.id}">
        <input id="blockUrl" hidden name="deleteUrl" value="${pageContext.request.contextPath}/block">
        <input id="unlockUrl" hidden name="unlockUrl" value="${pageContext.request.contextPath}/unlock">
        <input id="deleteUrl" hidden name="deleteUrl" value="${pageContext.request.contextPath}/delete">
    <table class="table table-striped table-hover">
        <div class="btn-group" role="group" aria-label="Basic mixed styles example"
             style="position: absolute; right:9%; top: 20%;">
            <button id="blockButton" type="submit" class="btn btn-warning"><spring:message code="block"/></button>
            <button id="unlockButton" type="submit" class="btn btn-success">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-unlock"
                     viewBox="0 0 16 16">
                <path d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0
                0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2zM3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1
                 1 0 0 0-1-1H3z"></path>
            </svg></button>
            <button id="deleteButton" type="submit" class="btn btn-danger">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash"
                     viewBox="0 0 16 16">
                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0
                1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0
                0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1
                0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
            </svg></button>
        </div>

        <thead>
        <tr>
            <td scope="col">
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="checkAll" name="checkAll">
                    <label class="form-check-label" for="checkAll"></label>
                </div>
            </td>
            <td scope="col"><h5><spring:message code="ID"/></h5></td>
            <td scope="col"><h5><spring:message code="username"/></h5></td>
            <td scope="col"><h5><spring:message code="eMail"/></h5></td>
            <td scope="col"><h5><spring:message code="registration.date"/></h5></td>
            <td scope="col"><h5><spring:message code="login.last"/></h5></td>
            <td scope="col"><h5><spring:message code="status"/></h5></td>
        </tr>
        </thead>
        <c:forEach var="user" items="${users}">
            <c:choose>
                <c:when test="${user.isLocked}">
                    <tr id="row${user.id}" class="table-warning">
                </c:when>
                <c:otherwise>
                   <tr id="row${user.id}">
                </c:otherwise>
            </c:choose>
                <td style="content-align: center">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="chose" name="userId"
                               value="${user.id}">
                    </div>
                </td>
                <td>${user.id}</td>
            <td><h6>${user.username}
                <c:if test="${user.id == currentUser.id}">&nbsp
                    <span class="badge bg-success">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-person-check" viewBox="0 0 16 16">
                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0
                         1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516
                         10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                        <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708
                        0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                    </svg>&nbsp
                    </span>
                </c:if></h6>
            </td>
                <td>${user.email}</td>
                <td>
                    <fmt:parseDate value="${user.registrationDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                   var="parsedRegistrationDateTime" type="both"/>
                    <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${parsedRegistrationDateTime}"/></td>

                <td><fmt:parseDate value="${user.lastLoginDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                   var="parsedLastLoginDateTime" type="both"/>
                    <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${parsedLastLoginDateTime}"/></td>
                </td>
                <td id="statusCell${user.id}">
                    <c:if test="${user.isLocked}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-lock-fill" viewBox="0 0 16 16">
                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0
                            0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                        </svg>
                        <spring:message code="status.blocked"/>
                    </c:if>
                    <c:if test="${!user.isLocked}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-check2" viewBox="0 0 16 16">
                            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1
                            .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
                        </svg>
                        <spring:message code="status.active"/>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        var currId = document.getElementById('currentUserId').value;
        console.log(currId)
        $('button#deleteButton[type=submit]').click(function (e) {
            console.log("Delete ajax");
            e.preventDefault();
            var form = document.forms['userManagementForm'];
            var formData = new FormData(form);
            var ajaxReq = $.ajax({
                url:document.getElementById('deleteUrl').value,
                type: 'DELETE',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    return xhr;
                },
            });
            ajaxReq.done(function (msg) {
               formData.getAll('userId').forEach(element => {
                       if(element === currId){
                           window.location = "/logout";
                       }
                       jQuery('#row' + element).hide(700);
               }
               );
            });
            ajaxReq.fail(function (jqXHR) {
            console.log("Error when try to delete users")
            });
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        var currId = document.getElementById('currentUserId').value;
        console.log(currId)
        $('button#blockButton[type=submit]').click(function (e) {
            console.log("Block ajax");
            e.preventDefault();
            var form = document.forms['userManagementForm'];
            var formData = new FormData(form);
            var ajaxReq = $.ajax({
                url:document.getElementById('blockUrl').value,
                type: 'PATCH',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    return xhr;
                },
            });
            ajaxReq.done(function (msg) {
                formData.getAll('userId').forEach(element => {
                        if(element === currId){
                            window.location = "/logout";
                        }
                    jQuery('#row' + element.toString()).addClass("table-warning");
                    jQuery('#statusCell' + element.toString()).html('<svg xmlns="http://www.w3.org/2000/svg" width="16" ' +
                        'height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">' +
                                           ' <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2' +
                        ' 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>' +
                                           ' </svg><spring:message code="status.blocked"/>');
                    }
                );
            });
            ajaxReq.fail(function (jqXHR) {
                console.log("Error when try to block  users")
            });
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $('button#unlockButton[type=submit]').click(function (e) {
            console.log("Unlock ajax");
            e.preventDefault();
            var form = document.forms['userManagementForm'];
            var formData = new FormData(form);
            var ajaxReq = $.ajax({
                url:document.getElementById('unlockUrl').value,
                type: 'PATCH',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    return xhr;
                },
            });
            ajaxReq.done(function (msg) {
                formData.getAll('userId').forEach(element => {
                        jQuery('#row' + element.toString()).removeClass("table-warning");
                        jQuery('#statusCell' + element.toString()).html('<svg xmlns="http://www.w3.org/2000/svg"' +
                            ' width="16" height="16" fill="currentColor"class="bi bi-check2" viewBox="0 0 16 16">' +
                            ' <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1.708-' +
                            '.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path> </svg>' +
                            ' </svg><spring:message code="status.active"/>');
                    }
                );
            });
            ajaxReq.fail(function (jqXHR) {
                console.log("Error when try to block  users")
            });
        });
    });
</script>
<script type="text/javascript">
    $("#checkAll").change(function () {
        if ($(this).is(':checked'))
            $(".form-check-input").attr('checked', true);
        else
            $(".form-check-input").removeAttr('checked');
    });
</script>
</body>
</html>