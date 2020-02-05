package com.qihang.timer;

import java.util.TimerTask;

import com.qihang.listener.QHServletContextListener;

public class AutoClearAccessNumTask extends TimerTask{

	
	
	
	@Override
	public void run() {
		//定时清空当天访问量
		QHServletContextListener.totalAccessNum = 0;
		
		System.out.println("#######定时清空当天访问量成功：" + QHServletContextListener.totalAccessNum);
	}

}
