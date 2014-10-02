package com.shoemaker.taxApp.constants;

public enum PayFrequency implements ICodeDisplayKey {
	DAILY("common.daily"), WEEKLY("common.weekly"), MONTHLY("common.monthly"), BI_WEEKLY(
			"common.biweekly");

	private String displayNameKey;

	private PayFrequency(String displayNameKey) {
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
