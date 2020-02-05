package com.qihang.intercaptor;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.qihang.common.utils.IpUtils;
import com.qihang.listener.QHServletContextListener;
import com.qihang.pojo.AccessLog;
import com.qihang.service.AccessLogService;

public class SessionInterceptor implements HandlerInterceptor {

	@Autowired
	private AccessLogService logService;
	
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		Object object = session.getAttribute("is_access");
		if(object == null){
			AccessLog log = new AccessLog();
			log.setIp(IpUtils.getIpAddress(request));
			log.setSessionid(session.getId());
			log.setAccessTime(new Date());
			logService.insert(log);
			int totalAccessNum = QHServletContextListener.totalAccessNum;
			QHServletContextListener.totalAccessNum = totalAccessNum + 1;
			session.setAttribute("is_access","true");
			System.out.println("######## 有新游客访问：" + log.getIp() + ",user-agent:" + request.getHeader("user-agent")  + "，当天总访问量为：" + QHServletContextListener.totalAccessNum);
			
		}
		return true;
	}

}
