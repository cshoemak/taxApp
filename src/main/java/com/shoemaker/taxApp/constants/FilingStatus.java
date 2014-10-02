package com.shoemaker.taxApp.constants;

public enum FilingStatus implements ICodeDisplayKey {
	SINGLE("common.single"),
	MARRIED("common.married"),
	MARRIED_USE_SINGLE("paycheckCalculator.filingStatuses.marriedUseSingle"),
	NONRESIDENT_ALIEN("paycheckCalculator.filingStatuses.nonresidentAlien");

	private String displayNameKey;

	private FilingStatus(String displayNameKey) {
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
