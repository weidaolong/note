package com.facedops.note.tag;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class UrlTag extends BodyTagSupport{
	private final static String urlReg_start = "(^|\\?|&)";
	private final static String urlReg_end = "=\\d*(&|$)";

	private String searchParam;
	private String regParam;
	private String regValue;
	@Override
	public int doStartTag() throws JspException {
		if(searchParam==null || "".equals(searchParam)){
			searchParam=regParam+"="+regValue;
		}else{
			searchParam=replaceUrl(searchParam, regParam, regValue);
		}
		try {
			out(pageContext,searchParam);
		} catch (IOException ex) {
			throw new JspException(ex.toString(), ex);
		}
		
		return super.doStartTag();
	}
	
	
	private static String replaceUrl(String searchParam,String regParam,Object regValue) {
		String reg = urlReg_start + regParam+ urlReg_end;
		Pattern pattern = Pattern.compile(reg);
		Matcher matcher = pattern.matcher(searchParam);
		if (matcher.find()) {
			searchParam=matcher.replaceFirst(matcher.group(1)+regParam+"="+regValue+matcher.group(2));
		}else{
			if(searchParam.charAt(searchParam.length()-1)=='&'){
				searchParam+=regParam+"="+regValue;
			}else{
				searchParam+="&"+regParam+"="+regValue;
			}
		}
		return searchParam;
	}
	  public static void out(PageContext pageContext,
              Object obj) throws IOException{
		  JspWriter w = pageContext.getOut();
		  w.write(obj.toString());
	  }

	public String getSearchParam() {
		return searchParam;
	}


	public void setSearchParam(String searchParam) {
		this.searchParam = searchParam;
	}


	public String getRegParam() {
		return regParam;
	}


	public void setRegParam(String regParam) {
		this.regParam = regParam;
	}


	public String getRegValue() {
		return regValue;
	}


	public void setRegValue(String regValue) {
		this.regValue = regValue;
	}
}
