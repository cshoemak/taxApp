package com.shoemaker.taxApp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoemaker.taxApp.constants.FilingStatus;
import com.shoemaker.taxApp.constants.GrossPayType;
import com.shoemaker.taxApp.constants.PayFrequency;
import com.shoemaker.taxApp.constants.TaxYear;
import com.shoemaker.taxApp.constants.UsState;
import com.shoemaker.taxApp.models.PaycheckCalculatorBean;

public class PaycheckCalculatorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public static final String DATE_FORMAT = "MM/dd/yyyy";

	private static final String JSP_URL = "/WEB-INF/paycheckCalculator.jsp";
	private static final String JSP_SUCCESS_URL = "/WEB-INF/paycheckCalculatorResults.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		setUpReq(req, new PaycheckCalculatorBean());
		req.getRequestDispatcher(JSP_URL).forward(
				req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PaycheckCalculatorBean calculatorBean = new PaycheckCalculatorBean();
		List<String> errorMessages = buildBean(calculatorBean, req);
		// here's where additional validation would be performed based on bounds for number types, etc.
		setUpReq(req, calculatorBean); // ensure that a failed submission preserves user values.
		String forwardUrl = JSP_URL;
		if (!errorMessages.isEmpty()) { // normally handled by an MVC framework.
			req.setAttribute("errors", errorMessages);
		} else {
			req.setAttribute("totalFederal", Float.valueOf((float) 145.30));
			req.setAttribute("totalFica", Float.valueOf((float) 30.50));
			req.setAttribute("totalMedicare", Float.valueOf((float) 14.5));
			forwardUrl = JSP_SUCCESS_URL;
		}
		req.getRequestDispatcher(forwardUrl).forward(req, resp);
	}

	private void setUpReq(HttpServletRequest req,
			PaycheckCalculatorBean calculatorBean) {
		req.setAttribute("dateFormat", DATE_FORMAT);
		req.setAttribute("calculatorBean", calculatorBean);
		req.setAttribute("usStates", UsState.values());
		req.setAttribute("supportedYears", TaxYear.values());
		req.setAttribute("grossPayTypes", GrossPayType.values());
		req.setAttribute("payFrequencies", PayFrequency.values());
		req.setAttribute("filingStatuses", FilingStatus.values());
	}

	private List<String> buildBean(PaycheckCalculatorBean calculatorBean,
			HttpServletRequest req) {
		List<String> errors = new ArrayList<String>();
		TaxYear taxYear = (TaxYear) validateEnumFromRequest(TaxYear.class,
				"taxYear", req, errors);
		if (taxYear != null) {
			calculatorBean.setTaxYear(taxYear);
		}
		UsState state = (UsState) validateEnumFromRequest(UsState.class,
				"state", req, errors);
		if (state != null) {
			calculatorBean.setState(state);
		}
		Float grossPay = validateFloatFromRequest("grossPay", req, errors);
		if (grossPay != null) {
			calculatorBean.setGrossPay(grossPay.floatValue());
		}
		GrossPayType grossPayType = (GrossPayType) validateEnumFromRequest(
				GrossPayType.class, "grossPayType", req, errors);
		if (grossPayType != null) {
			calculatorBean.setGrossPayType(grossPayType);
		}
		// etc. but would be unnecessary if using an MVC framework like Struts2 or Spring
		return errors;
	}

	private Float validateFloatFromRequest(String paramName,
			HttpServletRequest req, List<String> errors) {
		Float result = null;
		try {
			String paramValue = req.getParameter(paramName);
			if (paramValue != null) {
				result = Float.valueOf(paramValue);
			}
		} catch (NumberFormatException e) {
			errors.add(paramName + " was not a valid number.");
		}
		return result;
	}

	private Object validateEnumFromRequest(Class<? extends Enum> enumClass,
			String paramName, HttpServletRequest req, List<String> errors) {
		Object value = null;
		try {
			value = Enum.valueOf(enumClass, req.getParameter(paramName));
		} catch (Exception e) {
			errors.add(paramName + " was not a valid option.");
		}
		return value;
	}
}