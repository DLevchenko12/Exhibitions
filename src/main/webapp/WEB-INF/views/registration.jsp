<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : pageContext.request.locale}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>

<jsp:include page="/WEB-INF/views/parts/header.jsp"/>
<div class="page-wrapper">
    <div class="container">
        <div>
            <h1 class="flow-text"><fmt:message key="text.registration.form"/></h1>
        </div>
        <div class="form">
            <form method="post" action="${pageContext.request.contextPath}/exhibitions/register-user">
                <label>
                    <input type="text" pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$" required
                           placeholder="<fmt:message key="text.email"/>" name="email">
                </label> <br>
                <label>
                    <input type="text" required placeholder="<fmt:message key="text.password"/>" name="password">
                </label> <br>
                <input class="btn" type="submit" value="<fmt:message key="text.registration"/>">
            </form>
        </div>
        <c:if test="${sessionScope.emailIsPresent != null}">
            ${sessionScope.emailIsPresent} -
            <fmt:message key="text.incorrect.user.present"/>
        </c:if>
    </div>
</div>

<jsp:include page="/WEB-INF/views/parts/footer.jsp"/>
