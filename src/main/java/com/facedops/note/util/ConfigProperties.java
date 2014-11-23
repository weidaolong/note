package com.facedops.note.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

/**
 * ConfigProperties Description:
 */

public class ConfigProperties {
	private static Properties config = null;

	private static String FILE_NAME = "/config.properties";

	public static String getConfig(String key) {
		if (config == null) {
			loadConfig();
		}
		String value = config.getProperty(key);
		if (value != null && !value.equals("")) {
			try {
				value = new String(value.getBytes("ISO8859-1"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return value;
	}

	public static void loadConfig() {
		String path = ConfigProperties.class.getResource(FILE_NAME).getFile();
		InputStream in = null;
		try {
			path = URLDecoder.decode(path, "UTF-8");
			in = new FileInputStream(path);// ConfigProperties.class.getResourceAsStream(FILE_NAME);
			config = new Properties();
			config.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (Exception ex) {
			}
		}
	}

	static {
		loadConfig();
	}

	public static void main(String[] args) {
		System.out.println(getConfig("BACKFILE_PATH"));
	}
}