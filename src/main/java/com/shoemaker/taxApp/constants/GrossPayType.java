package com.shoemaker.taxApp.constants;

public enum GrossPayType implements ICodeDisplayKey {
	ANNUALY("common.annually"), PAY_PERIOD(
			"paycheckCalculator.grossPayTypes.payPeriod");

	private String displayNameKey;

	private GrossPayType(String displayNameKey) {
		this.displayNameKey = displayNameKey;
	}

	@Override
	public String getDisplayNameKey() {
		return displayNameKey;
	}

	@Override
	public String getCode() {
		return name();
	}
}
