package com.utility;

public class GetRamdomKey {
	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	public static String getKey() {
		int count =8;
		String key = new String();
		while (count-- != 0) {
			int character = (int) (Math.random() * ALPHA_NUMERIC_STRING
					.length());
			key += ALPHA_NUMERIC_STRING.charAt(character);
		}
		return key;
	}
}