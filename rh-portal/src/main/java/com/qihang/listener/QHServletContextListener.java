package com.qihang.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.qihang.common.pojo.Page;
import com.qihang.common.utils.JsonUtils;
import com.qihang.pojo.Content;
import com.qihang.pojo.Course;
import com.qihang.pojo.GuestBook;
import com.qihang.service.AccessLogService;
import com.qihang.service.ContentService;
import com.qihang.service.CourseService;
import com.qihang.service.GuestBookService;
import com.qihang.timer.AutoClearAccessNumTaskManager;

/**
 * 
 * 起航上下文监听器
 * @author Administrator
 *
 */
public class QHServletContextListener implements ServletContextListener{

	private ApplicationContext app;
	
	private List<String>  codeList = new ArrayList<>();
	
	public static int totalAccessNum = 0;
	
	

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		codeList.add("zylbt");//主页轮播图
		codeList.add("logo");//主页轮播图
		codeList.add("bzzx");//帮助中心
		codeList.add("gywm");//关于我们
		codeList.add("lxwm");//联系我们
		codeList.add("gsjj");//公司简介
		
		ServletContext servletContext = arg0.getServletContext();
		
		/**
		 * 网站初始化
		 */
		app = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		
		ContentService contentService = app.getBean(ContentService.class);
		CourseService courseService = app.getBean(CourseService.class);
		AccessLogService accessLogService = app.getBean(AccessLogService.class);
		
		//获取主页轮播图
		System.out.println("*******************网站初始化开始*******************");
		for (String code : codeList) {
			List<Content> list = contentService.findByCode(code);
			servletContext.setAttribute(code, list);
			System.out.println("*********************加载" +  code + "成功！" + JsonUtils.objectToJson(list));
		}
		
//		//初始化留言板
		GuestBookService guestBookService = app.getBean(GuestBookService.class);
		List<GuestBook> list = guestBookService.findTop(6);
		servletContext.setAttribute("guestBooks", list);
		System.out.println("*********************留言板加载成功！" + JsonUtils.objectToJson(list));
//		
		//初始化开班时间
		List<Content> kbsj = contentService.findTop(8, "kbsj");
		servletContext.setAttribute("kbsj", kbsj);
		System.out.println("*********************开班时间加载成功！");
		
		//初始化学员风采
		List<Content> xyfc = contentService.findTop(12, "xyfczs");
		servletContext.setAttribute("xyfc", xyfc);
		System.out.println("*********************学员风采加载成功！");
		//初始化课程学习
		Page page = new Page();
		page.setCurrentPage(1);
		page.setPageSize(8);
		page.setOrder("update_date desc");
		page = courseService.findByPage(page, new Course());
		servletContext.setAttribute("kcxy", page.getResult());
		System.out.println("*********************课程学习加载成功！");
		
		//获取当天访问量
		int totalAccessNum = accessLogService.getTotalAccessNumToday();
		System.out.println("*********************加载当天访问量成功：" + totalAccessNum);
		QHServletContextListener.totalAccessNum = totalAccessNum;
		
		//创建定时清空当天访问数量的任务
		new AutoClearAccessNumTaskManager();
		System.out.println("*******************创建定时清空当天访问数量的任务成功*******************");
		
		//获取前7校园资讯
		List<Content> list3 = contentService.findTop(5, "xyzx");
		servletContext.setAttribute("xyzx", list3);
		System.out.println("*******************获取校园资讯成功*******************");
		
		
		//获取校长寄语
		List<Content> list4 = contentService.findByCode("xzjy");
		if(list4!= null && list4.size() == 1){
			servletContext.setAttribute("xzjy", list4);
			System.out.println("*******************获取校长寄语成功*******************");
		}
		
		System.out.println("*******************网站初始化结束*******************");
		
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}
}
