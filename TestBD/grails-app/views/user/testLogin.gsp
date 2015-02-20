<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="testbd.User" %>
<%@ page import="org.springframework.validation.FieldError" %>

<!doctype html>
<html>
<head>
    <meta name = "layout" content = "main">
    <g:set var = "entityName" value = "Test Login"/>
    <title><g:message code = "Test Login" args="[entityName]"/></title>
</head>

<body>
<div class = "nav" role = "navigation">
    <ul>
        <li><a class = "home" href = "${createLink(uri: '/')}">home</a></li>
        <li><g:link class = "list" action="logout">logout</g:link></li>
    </ul>
</div>

<div id="create-endUser" class="content scaffold-create" role="main">
    <h1>LOGIN</h1>
    <g:if test="${flash.message}">
        <div class = "message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${userInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="authenticate">
        <fieldset class="form">

            <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')}">
                <label for="userName">
                    <g:message code="endUser.userName.label" default="Usuario"/>
                </label>
                <g:textField name="userName" value="${userInstance?.userName}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')}">
                <label for="password">
                    <g:message code="endUser.password.label" default="Password"/>
                </label>
                <g:field type="password" name="password" value="${userInstance?.password}"/>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="login" class="save" value="Login"/>
        </fieldset>
    </g:form>

</div>
</body>
</html>