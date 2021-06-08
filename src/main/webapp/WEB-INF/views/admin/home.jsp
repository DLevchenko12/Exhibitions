<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : pageContext.request.locale}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>

<%--<head>--%>
<%--    <title><fmt:message key="text.admin.homepage.title"/></title>--%>
<%--</head>--%>
<jsp:include page="/WEB-INF/views/parts/header.jsp"/>

<div class="page-wrapper">
    <div class="container">
        <div class="row">
            <h3 class="flow-text"><fmt:message key="text.admin.homepage.title"/></h3>
        </div>


        <form method="post" action="${pageContext.request.contextPath}/exhibitions/admin/users">
            <input class="btn" type="submit" value="<fmt:message key="text.admin.users.page"/>">
        </form>

        <form method="post" action="${pageContext.request.contextPath}/exhibitions/admin/exhibitions">
            <input class="btn" type="submit" value="<fmt:message key="text.admin.exhibitions.page"/>">
        </form>
    </div>
</div>

<jsp:include page="/WEB-INF/views/parts/footer.jsp"/>
