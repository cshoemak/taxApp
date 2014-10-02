package com.shoemaker.taxApp.constants;

public enum TaxYear {
	Y2010, Y2011, Y2012, Y2013, Y2014;

	public String getDisplayName() {
		return name().substring(1);
	}

	public String getCode() {
		return name();
	}
}
