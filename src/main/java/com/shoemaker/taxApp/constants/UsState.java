package com.shoemaker.taxApp.constants;

public enum UsState implements ICodeDisplayKey {
	AZ("common.state.arizona"), CA("common.state.california"), OR(
			"common.state.oregon"), UT("common.state.utah");

	private String displayNameKey;

	private UsState(String displayNameKey) {
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
