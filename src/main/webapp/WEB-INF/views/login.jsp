<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : pageContext.request.locale}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>

<jsp:include page="/WEB-INF/views/parts/header.jsp"/>

<div class="page-wrapper">
    <div class="container">
        <h1 class="flow-text"><fmt:message key="text.enter.login.and.password"/></h1>
        <form method="post" action="${pageContext.request.contextPath}/exhibitions/home">
            <label>
                <input type="text" pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$" required
                       placeholder="<fmt:message key="text.email"/>" name="email">
            </label> <br>
            <label>
                <input type="password" required placeholder="<fmt:message key="text.password"/>" name="password">
            </label> <br>
            <input class="btn" type="submit" value="<fmt:message key="text.enter"/>">
        </form>
        <c:if test="${not empty sessionScope.incorrectInput}">
            <fmt:message key="text.incorrect.password"/>
        </c:if>
    </div>
</div>

<jsp:include page="/WEB-INF/views/parts/footer.jsp"/>
