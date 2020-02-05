package com.qihang.common.pojo;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;

public class Page {

	private String url;
	private int pageSize = 10;

	private int currentPage = 1;

	private int totalRecord = 10;

	private int totalPage;

	private Map<String, String> parameter;

	private String html;

	private String order;
	
	private Object result;
	
	
	

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		com.github.pagehelper.Page page = (com.github.pagehelper.Page) result;
		setTotalRecord((int) page.getTotal());
		
		
		this.result = result;
	}

	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		this.totalPage = totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1;
		
		
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public Map<String, String> getParameter() {
		return parameter;
	}

	public void setParameter(Map<String, String> parameter) {
		this.parameter = parameter;
	}

	public String getHtml() {
		if(totalPage == 0){
			return "";
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<div class=\"paging\">\r\n" + 
				"					<ul class=\"pagination\">\r\n" + 
				"");
		
		sb.append("<li><a href=\""+href(1)+"\">«</a></li>\r\n" + 
				"");
		if(totalPage < 5 || currentPage <= 2){
			for(int i = 1 ; i <= totalPage; i ++){
				if(i == currentPage){
					sb.append("<li class=\"active\"><a href=\""+href(i)+"\">"+ i +"</a></li>\r\n" + 
							"");
				}else{
					sb.append("<li><a href=\""+href(i)+"\">"+i+"</a></li>");
				}
			}
		}else{
			if(currentPage > totalPage - 2){
				for(int i = totalPage - 4 ; i <= totalPage; i ++){
					if(i == currentPage){
						sb.append("<li class=\"active\"><a href=\""+href(i)+"\">"+ i +"</a></li>\r\n" + 
								"");
					}else{
						sb.append("<li><a href=\""+href(i)+"\">"+i+"</a></li>");
					}
				}
			}else{
				for(int i = currentPage - 2 ; i <= currentPage + 2; i ++){
					if(i == currentPage){
						sb.append("<li class=\"active\"><a href=\""+href(i)+"\">"+ i +"</a></li>\r\n" + 
								"");
					}else{
						sb.append("<li><a href=\""+href(i)+"\">"+i+"</a></li>");
					}
				}
			}
		}
		
		sb.append("<li><a href=\""+href(totalPage)+"\">»</a></li>\r\n" + 
				"");
		
		
		
		sb.append("\r\n" + 
				"					</ul>					\r\n" + 
				"				</div>\r\n" + 
				"");
		return sb.toString();
	}

	private String href(int pageNo){
		StringBuffer sb = new StringBuffer();
		sb.append(url + "?currentPage=" + pageNo);
		if(!StringUtils.isBlank(order)){
			sb.append("&order=" + order);
		}
		if(parameter != null && parameter.size() > 0){
			for (Entry<String, String> entry : parameter.entrySet()) {
				sb.append("&"+entry.getKey()+"=" + entry.getValue());
			}
		}
		return sb.toString();
	}
	
	public void setHtml(String html) {
		this.html = html;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	
	
	

}
