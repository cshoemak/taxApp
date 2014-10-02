package com.shoemaker.taxApp.models;

import java.util.Date;

import com.shoemaker.taxApp.constants.FilingStatus;
import com.shoemaker.taxApp.constants.GrossPayType;
import com.shoemaker.taxApp.constants.PayFrequency;
import com.shoemaker.taxApp.constants.TaxYear;
import com.shoemaker.taxApp.constants.UsState;

public class PaycheckCalculatorBean {
	private Date checkDate = new Date();
	private UsState state = UsState.AZ;
	private TaxYear taxYear = TaxYear.Y2014;
	private float grossPay = 0;
	private GrossPayType grossPayType = GrossPayType.ANNUALY;
	private float grossSalaryYTD = 0;
	private PayFrequency payFrequency = PayFrequency.WEEKLY;
	private FilingStatus federalFilingStatus = FilingStatus.SINGLE;
	private int numberOfFederalAllowances = 1;
	private float additionalFederalWithholding = 0;
	private boolean roundFederalWithholding = false;
	private boolean exemptFederalTax = false;
	private boolean exemptFica = false;
	private boolean exemptMedicare = false;

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public UsState getState() {
		return state;
	}

	public void setState(UsState state) {
		this.state = state;
	}

	public TaxYear getTaxYear() {
		return taxYear;
	}

	public void setTaxYear(TaxYear taxYear) {
		this.taxYear = taxYear;
	}

	public float getGrossPay() {
		return grossPay;
	}

	public void setGrossPay(float grossPay) {
		this.grossPay = grossPay;
	}

	public GrossPayType getGrossPayType() {
		return grossPayType;
	}

	public void setGrossPayType(GrossPayType grossPayType) {
		this.grossPayType = grossPayType;
	}

	public float getGrossSalaryYTD() {
		return grossSalaryYTD;
	}

	public void setGrossSalaryYTD(float grossSalaryYTD) {
		this.grossSalaryYTD = grossSalaryYTD;
	}

	public PayFrequency getPayFrequency() {
		return payFrequency;
	}

	public void setPayFrequency(PayFrequency payFrequency) {
		this.payFrequency = payFrequency;
	}

	public FilingStatus getFederalFilingStatus() {
		return federalFilingStatus;
	}

	public void setFederalFilingStatus(FilingStatus federalFilingStatus) {
		this.federalFilingStatus = federalFilingStatus;
	}

	public int getNumberOfFederalAllowances() {
		return numberOfFederalAllowances;
	}

	public void setNumberOfFederalAllowances(int numberOfFederalAllowances) {
		this.numberOfFederalAllowances = numberOfFederalAllowances;
	}

	public float getAdditionalFederalWithholding() {
		return additionalFederalWithholding;
	}

	public void setAdditionalFederalWithholding(
			float additionalFederalWithholding) {
		this.additionalFederalWithholding = additionalFederalWithholding;
	}

	public boolean isRoundFederalWithholding() {
		return roundFederalWithholding;
	}

	public void setRoundFederalWithholding(boolean roundFederalWithholding) {
		this.roundFederalWithholding = roundFederalWithholding;
	}

	public boolean isExemptFederalTax() {
		return exemptFederalTax;
	}

	public void setExemptFederalTax(boolean exemptFederalTax) {
		this.exemptFederalTax = exemptFederalTax;
	}

	public boolean isExemptFica() {
		return exemptFica;
	}

	public void setExemptFica(boolean exemptFica) {
		this.exemptFica = exemptFica;
	}

	public boolean isExemptMedicare() {
		return exemptMedicare;
	}

	public void setExemptMedicare(boolean exemptMedicare) {
		this.exemptMedicare = exemptMedicare;
	}
}
