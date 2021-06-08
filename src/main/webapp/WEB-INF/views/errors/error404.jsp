<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : pageContext.request.locale}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>

<jsp:include page="/WEB-INF/views/parts/header.jsp"/>
<div class="container">
    <div class="error">
        <img src="${pageContext.request.contextPath}/resources/images/404-UFO.png" alt="404 not found"/>
    </div>
</div>
<jsp:include page="/WEB-INF/views/parts/footer.jsp"/>