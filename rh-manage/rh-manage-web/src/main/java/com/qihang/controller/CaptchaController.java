package com.qihang.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.code.kaptcha.Producer;
/**
 * 
 * @ClassName: CaptchaController
 * @Description: 验证码controller
 * @author wangpf
 * @date 2017年1月4日
 */
@Controller
public class CaptchaController {

	@Autowired
	private Producer captchaProducer;

	/**
	 * 
	 * @Title: captcha
	 * @Description: 获取验证码
	 * @param @param request
	 * @param @param response
	 * @return void
	 */
	@RequestMapping("/verify/image")
	public void captcha(HttpServletRequest request, HttpServletResponse response) {
		/* 验证码的值 */
		String text = captchaProducer.createText();
		
		/*将验证码的值放入session中*/
		request.getSession().setAttribute("captcha", text);

		/* 验证码的图片 */
		BufferedImage image = captchaProducer.createImage(text);
		/* 设置响应头 */
		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("image/jpeg");



		// 响应图片到客户端
		ServletOutputStream out = null;
		try {
			out = response.getOutputStream();
			ImageIO.write(image, "jpg", out);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}
