<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ attribute name="current" required="true" type="java.lang.Object"
	description="Current option code. Usually the value of 'var'."%>
<%@ attribute name="selected" required="true" type="java.lang.Object"
	description="Default value for the select in question."%>
<%@ attribute name="displayString" required="false" type="java.lang.String"
	description="The text content of the resulting option tag. If no value is specified, the string equivalent of @current will be used."%>

<c:out value="${testing}"/>
<c:set var="displayText" value="${not empty displayString ? displayString : current }"/>

<c:choose>
	<c:when test="${current eq selected}">
		<option value="${current}" selected="selected">
			<c:out value="${displayText}"/>
		</option>
	</c:when>
	<c:otherwise>
		<option value="${current}"><c:out value="${displayText}"/></option>
	</c:otherwise>
</c:choose>
