<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="titleHeading">
	<fmt:message key="paycheckCalculator.paycheckCalculator"/> <fmt:message key="common.results"/>
</c:set>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<c:url var="cssUrl" value="/css/taxApp.css"/>
		<link rel="stylesheet" type="text/css" href="${cssUrl}"/>
		<c:url var="jqueryUiCssUrl" value="/css/jquery-ui.css"/>
		<link rel="stylesheet" type="text/css" href="${jqueryUiCssUrl}"/>
		<c:url var="jqueryUrl" value="/js/jquery-2.1.1.js"/>
		<script type="text/javascript" src="${jqueryUrl}"></script>
		<c:url var="jqueryUiUrl" value="/js/jquery-ui.js"/>
		<script type="text/javascript" src="${jqueryUiUrl}"></script>
		<c:url var="taxAppJsUrl" value="/js/taxApp.js"/>
		<script type="text/javascript" src="${taxAppJsUrl}"></script>
		<title><c:out value="${titleHeading}"/></title>
	</head>
	<body>
		<h2><c:out value="${titleHeading}"/></h2>
		<table>
			<caption><fmt:message key="paycheckCalculator.withholdingPerPaycheck"/></caption>
				<tbody>
				<tr>
					<td><fmt:message key="paycheckCalculator.federalTax"/></td>
					<td><fmt:formatNumber type="currency" currencySymbol="$" value="${totalFederal}"/></td>
				</tr>
				<tr>
					<td><fmt:message key="common.fica"/></td>
					<td><fmt:formatNumber type="currency" currencySymbol="$" value="${totalFica}"/></td>
				</tr>
				<tr>
					<td><fmt:message key="common.medicare"/></td>
					<td><fmt:formatNumber type="currency" currencySymbol="$" value="${totalMedicare}"/></td>
				</tr>
				</tbody>
		</table>
	</body>
</html>