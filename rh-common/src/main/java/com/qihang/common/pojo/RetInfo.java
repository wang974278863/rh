package com.qihang.common.pojo;

public class RetInfo {

	private String code;
	private String retMsg;
	private Object obj;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getRetMsg() {
		return retMsg;
	}

	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public RetInfo(String code, String retMsg) {
		super();
		this.code = code;
		this.retMsg = retMsg;
	}

	public RetInfo(String code) {
		super();
		this.code = code;
	}

	public RetInfo() {
		this.code = Constants.FAIL;
		this.retMsg = "操作失败！";
	}

	public RetInfo(String code, Object obj) {
		super();
		this.code = code;
		this.obj = obj;
	}

	public RetInfo(String code, String retMsg, Object obj) {
		super();
		this.code = code;
		this.retMsg = retMsg;
		this.obj = obj;
	}

	
}
