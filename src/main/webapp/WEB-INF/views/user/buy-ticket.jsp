<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : pageContext.request.locale}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>

<jsp:include page="/WEB-INF/views/parts/header.jsp"/>

<div class="container">
    <div class="row">
        <h3 class="flow-text"><fmt:message key="text.admin.exhibitions.page"/></h3>
    </div>

    <div class="row">
        <!-- list-of-shows -->
        <div class="col s8">
            <div class="list-of-shows">
                <div class="show-item">
                    <div class="row">
                        <div class="col s12">
                            <b><fmt:message key="text.exhibition.topic"/>:</b>
                            <div class="show-item-title">
                                ${requestScope.exhibition.topic}
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <fmt:message key="text.exhibition.category"/>:
                            <span>${requestScope.exhibition.category.name}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s6">
                            <fmt:message key="text.exhibition.dates"/>:
                            <span>${requestScope.exhibition.startDate} - ${requestScope.exhibition.endDate}</span>
                        </div>
                        <div class="col s6">
                            <fmt:message key="text.exhibition.time"/>:
                            <span>${requestScope.exhibition.startTime} - ${requestScope.exhibition.endTime}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s3">
                            <fmt:message key="text.exhibition.price"/>:
                            <span>${requestScope.exhibition.price}</span>
                        </div>
                        <div class="col s3">
                            <fmt:message key="text.exhibition.places"/>:
                            <span>${requestScope.exhibition.capacity}</span>
                        </div>
                        <div class="col s3">
                            <fmt:message key="text.exhibition.placesLeft"/>:
                            <span>${requestScope.exhibition.remainingSeats}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s2">
                            <fmt:message key="text.exhibition.hall-name"/>:
                        </div>
                        <c:forEach var="hall" items="${requestScope.exhibition.hallList}">
                            <div class="col s2">
                                <span>${hall.name}</span>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col s6">
                            <fmt:message key="text.exhibition.status"/>:
                            <span>${requestScope.exhibition.status}</span>
                        </div>
                        <div class="col s6">
                            <form method="post"
                                  action="${pageContext.request.contextPath}/exhibitions/user/get-tickets">
                                <input type="number" hidden name="exh_id" value="${requestScope.exhibition.id}"/>
                                <div class="col s4">
                                    <input id="t_am" type="number" min="1" name="amount"
                                           max="${requestScope.exhibition.remainingSeats}"
                                           placeholder="1-${requestScope.exhibition.remainingSeats}" required>
                                    <label for="t_am"></label>
                                </div>
                                <div class="col s8">
                                    <input type="submit" class="btn"
                                           value="<fmt:message key="text.user.ticket.get"/>"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${not empty sessionScope.incorrectTicket}">
        Incorrect ticket!
    </c:if>
</div>

<jsp:include page="/WEB-INF/views/parts/footer.jsp"/>