<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="taxApp" %>
<!DOCTYPE html>
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
<title><fmt:message key="paycheckCalculator.paycheckCalculator"/></title>
</head>
<body>
	<c:if test="${not empty errors}">
		<div class="errorBox">
			<c:forEach var="error" items="${errors}">
				<div class="error">
					<c:out value="${error}"/>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<h2><fmt:message key="paycheckCalculator.paycheckCalculator"/></h2>
	<form action="PaycheckCalculator" method="POST">
		<fieldset>
			<legend><fmt:message key="paycheckCalculator.calculationBasedOn"/>:</legend>
			<div class="field">
				<label for="taxYear" class="inlineLabel"><fmt:message key="paycheckCalculator.taxYear"/></label>
				<select name="taxYear">
					<c:forEach var="year" items="${supportedYears}">
						<taxApp:selectOption selected="${calculatorBean.taxYear.code}" current="${year.code}" displayString="${year.displayName}"/>
					</c:forEach>
				</select>
				<label for="state" class="inlineLabel"><fmt:message key="common.for"/>:</label>
				<select name="state">
					<c:forEach var="usState" items="${usStates}">
						<fmt:message var="displayString" key="${usState.displayNameKey}"/>
						<taxApp:selectOption selected="${calculatorBean.state.code}" current="${usState.code}" displayString="${displayString}"/>"/>
					</c:forEach>
				</select>
			</div>
		</fieldset>
		<fieldset>
			<legend><fmt:message key="paycheckCalculator.generalInformation"/></legend>
			<div class="field">
				<label for="checkDate"><fmt:message key="paycheckCalculator.checkDate"/></label>
				<fmt:formatDate var="checkDateFormatted" value="${calculatorBean.checkDate}" pattern="${dateFormat}"/>
				<input class="datepick" type="date" name="checkDate" value="${checkDateFormatted}"/>
			</div>
			<div class="field">
				<label for="grossPay"><fmt:message key="paycheckCalculator.grossPay"/></label>
				<input type="text" name="grossPay" value="${calculatorBean.grossPay}"/>
				<select name="grossPayType">
					<c:forEach var="grossPayType" items="${grossPayTypes}">
						<fmt:message var="displayText" key="${grossPayType.displayNameKey}"/>
						<taxApp:selectOption selected="${paycheckCalculator.grossPayType.code}" current="${grossPayType.code}" displayString="${displayText}"/>
					</c:forEach>
				</select>
			</div>
			<div class="field">
				<label for="grossSalaryYTD"><fmt:message key="paycheckCalculator.grossSalaryYTD"/></label>
				<input type="text" name="grossSalaryYTD" value="${paycheckCalculator.grossSalaryYTD}"/>
			</div>
			<div class="field">
				<label for="payFrequency"><fmt:message key="paycheckCalculator.payFrequency"/></label>
				<select>
					<c:forEach var="frequencyType" items="${payFrequencies}">
						<fmt:message var="displayText" key="${frequencyType.displayNameKey}"/>
						<taxApp:selectOption selected="${paycheckCalculator.payFrequency.code}" current="${frequencyType.code}" displayString="${displayText}"/>
					</c:forEach>
				</select>
			</div>
			<div class="field">
				<label for="federalFilingStatus"><fmt:message key="paycheckCalculator.federalFilingStatus"/></label>
				<select name="federalFilingStatus">
					<c:forEach var="filingStatus" items="${filingStatuses}">
						<fmt:message var="displayText" key="${filingStatus.displayNameKey}"/>
						<taxApp:selectOption selected="${paycheckCalculator.federalFilingStatus.code}" current="${filingStatus.code}" displayString="${displayText}"/>
					</c:forEach>
				</select>
			</div>
			<div class="field">
				<label for="numberOfFederalAllowances"><fmt:message key="paycheckCalculator.numberOfFederalAllowances"/></label>
				<input type="number" name="numberOfFederalAllowances" value="${paycheckCalculator.numberOfFederalAllowances}"/>
			</div>
			<div class="field">
				<label for="additionalFederalWithholding"><fmt:message key="paycheckCalculator.additionalFedWithholding"/></label>
				<input type="text" name="additionalFederalWithholding" value="${paycheckCalculator.additionalFederalWithholding}"/>
			</div>
			<div class="field">
				<label for="roundFederalWithholding"><fmt:message key="paycheckCalculator.roundFederalWithholding"/>?</label>
				<c:choose>
					<c:when test="${paycheckCalculator.roundFederalWithholding}">
						<input type="checkbox" name="roundFederalWithholding" checked="checked"/>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="roundFederalWithholding"/>
					</c:otherwise>
				</c:choose>
			</div>
		</fieldset>
		<fieldset>
			<legend><fmt:message key="paycheckCalculator.iAmExemptFrom"/>:</legend>
			<div class="field">
				<label for="exemptFederalTax" class="inlineLabel"><fmt:message key="paycheckCalculator.federalTax"/></label>
				<c:choose>
					<c:when test="${paycheckCalculator.exemptFederalTax}">
						<input type="checkbox" name="exemptFederalTax" checked="checked"/>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="exemptFederalTax"/>
					</c:otherwise>
				</c:choose>
				<label for="exemptFica" class="inlineLabel"><fmt:message key="common.fica"/></label>
				<c:choose>
					<c:when test="${paycheckCalculator.exemptFica}">
						<input type="checkbox" name="exemptFica" checked="checked"/>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="exemptFica"/>
					</c:otherwise>
				</c:choose>
				<label for="exemptMedicare" class="inlineLabel"><fmt:message key="common.medicare"/></label>
				<c:choose>
					<c:when test="${paycheckCalculator.exemptMedicare}">
						<input type="checkbox" name="exemptMedicare" checked="checked"/>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="exemptMedicare"/>
					</c:otherwise>
				</c:choose>
			</div>
		</fieldset>
		<fmt:message var="submitText" key="common.submit"/>
		<input type="submit" value="${submitText}"/>
	</form>
</body>
</html>
