package com.sp.bdi;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		List<String> strList = new ArrayList<String>();
		strList.add("박도영 바보");
		strList.add("박하늘 바보");
		strList.add("박경훈 바보");
		strList.add("김재빈 바보");
		model.addAttribute("strList", strList);
		return "home";
	}
	
	@RequestMapping(value="/test") // 메소드를 아무것도 주지 않음.
	public String test(Model m) {
		// /WEB-INF/views/test/test.jsp
		System.out.println(m); // 출력하면 {} 가뜸. 따라서 기본구조는 {} 맵형식, 이렇게나왔다는것은 누군가 new 했기때문에 null이뜨는 것임.
		return "test/test";
	}
}
