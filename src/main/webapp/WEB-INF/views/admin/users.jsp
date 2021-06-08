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
            <h1 class="flow-text"><fmt:message key="text.admin.users.page"/></h1>
        </div>
        <div class="row">
            <c:forEach var="user" items="${requestScope.users}">
                <div class="user-item">
                    <div class="row">
                        <div class="col s9">
                            <div class="row">
                                <div class="col s6">
                                    <fmt:message key="text.admin.users.id"/>:
                                    <span>${user.id}</span>
                                </div>
                                <div class="col s6">

                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6">
                                    <fmt:message key="text.admin.users.email"/>:
                                    <span>${user.email}</span>
                                </div>
                                <div class="col s6">

                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6">
                                    <fmt:message key="text.admin.users.role"/>:
                                    <span>${user.role}</span>
                                </div>
                                <div class="col s6">

                                </div>
                            </div>
                        </div>
                        <div class="col3">
                            <c:choose>
                                <c:when test="${user.role.user}">
                                    <form class="make-user" method="post"
                                          action="${pageContext.request.contextPath}/exhibitions/admin/make-user-admin">
                                        <label>
                                            <input type="number" hidden name="id" value="${user.id}"/>
                                        </label>
                                        <input type="submit" class="btn"
                                               value="<fmt:message key="text.admin.make.admin"/>"/>
                                    </form>
                                </c:when>
                                <c:when test="${user.role.admin and user.id != 1}">
                                    <form class="make-user" method="post"
                                          action="${pageContext.request.contextPath}/exhibitions/admin/make-admin-user">
                                        <label>
                                            <input type="number" hidden name="id" value="${user.id}"/>
                                        </label>
                                        <input type="submit" class="btn"
                                               value="<fmt:message key="text.admin.make.user"/>"/>
                                    </form>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/parts/footer.jsp"/>