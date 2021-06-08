<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : pageContext.request.locale}"
       scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <%--To be able to use these icons, you must include this line in the <head>portion of your HTML code --%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Compiled and minified JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


    <script>
        $(document).ready(function () {
            // datepicker
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd',
                setDefaultDate: true,
                defaultDate: new Date(),
            });

            // other code


        });
    </script>

    <style>
        nav {
            background-color: #00796b;
        }

        .page-footer.my-footer {
            padding-top: 0;
            background-color: #00796b;
        }

        .page-footer.my-footer .row {
            margin-bottom: 0;
        }

        body {
            display: grid;
            grid-template-rows: 1fr auto;
            height: 100vh;
            padding-top: 64px;
        }

        nav {
            position: fixed;
            top: 0;
            left: 0;
        }


        .main {
            display: block;
            /*border: 1px solid red;*/
            margin: 20px 0;
        }

        .page-wrapper {
            height: 100%;
            display: flex;
            /*align-items: center;*/
        }

        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }

        .error {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .flow-text {
            text-indent: 2%;
        }

        body {
            padding-top: 64px;
        }

        nav {
            position: fixed;
            top: 0px;
            left: 0;
        }

        .container {
        }

        .list-of-shows {
            /*border: 1px solid red;*/
            margin-bottom: 30px;
        }

        .show-item {
            border: 3px solid #00796b;
            border-radius: 20px;
            margin-bottom: 30px;
            padding: 14px;
        }

        .user-item {
            border: 3px solid #00796b;
            border-radius: 20px;
            margin-bottom: 10px;
            padding: 5px;
        }

        .user-item .row {
            margin-bottom: 10px;
        }

        .show-item .row {
            /*border: 1px solid red;*/
            margin-bottom: 5px;
            padding-bottom: 5px;
        }

        .show-item span {
            color: #333;
            background-color: #dfdfdf;
            border-radius: 5px;
            padding: 3px 10px;
        }

        .user-item span {
            color: #333;
            background-color: #dfdfdf;
            border-radius: 5px;
            padding: 3px 10px;
        }

        .show-item form {
            margin: 0;
            padding: 0;
        }

        .show-item .row:not(:last-child) {
            border-bottom: 1px solid #ccc;
        }

        .show-item-title {
            font-weight: bold;
            font-size: 20px;
            color: #333;
            background-color: #dfdfdf;
            border-radius: 5px;
            padding: 3px 10px;
        }

        .show-item .col {
            /*border: 1px solid red;*/
        }

        .show-create-form {
            position: fixed;
            border: 3px solid #00796b; /* Белая рамка */
            border-radius: 20px; /* Радиус скругления */
            padding: 10px;
        }

        .login-register-window {
            position: fixed;
            /*border: 3px solid #00796b; !* Белая рамка *!*/
            /*border-radius: 20px; !* Радиус скругления *!*/
            margin-left: 30px;
        }

        .make-user {
            text-align: center;
        }

        .pagination {
            text-align: center;
        }
    </style>

    <title><fmt:message key="text.title"/></title>
</head>
<body>
<nav>
    <div class="nav-wrapper">
        <div class="container">
            <a class="brand-logo"><fmt:message key="text.title"/></a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="${pageContext.request.contextPath}/exhibitions/main-page"><fmt:message
                        key="text.main"/></a></li>
                <li><a href="${pageContext.request.contextPath}/exhibitions/logout"><fmt:message key="text.logout"/></a>
                </li>
                <li><a href="${pageContext.request.contextPath}/exhibitions/language/en">English</a></li>
                <li><a href="${pageContext.request.contextPath}/exhibitions/language/ua">Українська</a></li>
            </ul>
        </div>
    </div>
</nav>

<%-- start main--%>
<main class="main-content"></main>