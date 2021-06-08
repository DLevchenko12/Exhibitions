<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : pageContext.request.locale}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>

<jsp:include page="/WEB-INF/views/parts/header.jsp"/>
<div class="page-wrapper">
    <div class="container">
        <div class="row">
            <h3 class="flow-text"><fmt:message key="text.user.homepage.title"/></h3>
        </div>
        <c:if test="${(requestScope.ordersList eq null) or
        (requestScope.ordersList.size() eq 0)}">
            <blockquote>
                <fmt:message key="text.user.homepage.no-one-ticket"/>
            </blockquote>
            <blockquote>
                <fmt:message key="text.user.homepage.where-get-ticket"/>
            </blockquote>
        </c:if>

        <div class="row">
            <%-- list of exhibitions --%>
            <div class="col s8">
                <div class="list-of-shows">
                    <c:forEach var="order" items="${requestScope.ordersList}">
                        <div class="show-item">
                            <div class="row">
                                <div class="col s12">
                                    <strong><fmt:message key="text.exhibition.topic"/>:</strong>
                                    <div class="show-item-title">
                                            ${order.exhibition.topic}
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s12">
                                    <fmt:message key="text.exhibition.category"/>:
                                    <span>${order.exhibition.category.name}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s6">
                                    <fmt:message key="text.exhibition.dates"/>:
                                    <span>${order.exhibition.startDate} - ${order.exhibition.endDate}</span>
                                </div>
                                <div class="col s6">
                                    <fmt:message key="text.exhibition.time"/>:
                                    <span>${order.exhibition.startTime} - ${order.exhibition.endTime}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s4">
                                    <fmt:message key="text.exhibition.price"/>:
                                    <span>${order.exhibition.price}</span>
                                </div>
                                <div class="col s4">
                                    <fmt:message key="text.order.amount"/>:
                                    <span>${order.amount}</span>
                                </div>
                                <div class="col s4">
                                    <fmt:message key="text.order.sum"/>:
                                    <span>${order.sum}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col s2">
                                    <fmt:message key="text.exhibition.hall-name"/>:
                                </div>
                                <c:forEach var="hall" items="${order.exhibition.hallList}">
                                    <div class="col s2">
                                        <span>${hall.name}</span>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row">
                                <div class="col s8">
                                    <fmt:message key="text.exhibition.status"/>:
                                    <span>${order.exhibition.status}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <%--pagination--%>
                <ul class="pagination">
                    <c:if test="${requestScope.currentPage ne 1}">
                        <li class="disabled"><a
                                href="${pageContext.request.contextPath}/exhibitions/user/home?page=1"><i
                                class="material-icons">chevron_left</i></a></li>
                    </c:if>

                    <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                        <c:choose>
                            <c:when test="${requestScope.currentPage eq i}">
                                <li class="disabled"><a
                                        href="${pageContext.request.contextPath}/exhibitions/user/home?page=${i}">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="waves-effect"><a
                                        href="${pageContext.request.contextPath}/exhibitions/user/home?page=${i}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${requestScope.currentPage lt requestScope.noOfPages}">
                        <li class="waves-effect">
                            <a href="${pageContext.request.contextPath}/exhibitions/user/home?page=${requestScope.currentPage + 1}">
                                <i class="material-icons">chevron_right</i>
                            </a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/parts/footer.jsp"/>