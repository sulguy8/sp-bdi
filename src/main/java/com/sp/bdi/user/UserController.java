package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	@Autowired
	@Qualifier("UserServiceImpl")
	private UserService us; //	UserService us = new UserServiceImpl(); 이것과 같음.

	
	@RequestMapping(value = "/user/list", method = RequestMethod.GET)
	public String getUserList(Model model) {
		List<Map<String, String>> list = us.getUserList();
		model.addAttribute("list", list);
		System.out.println(model);
		return "/user/list";
	}
	
	@RequestMapping(value = "/user/test", method = RequestMethod.GET)
	public String getPtBoardList(Model model) {
		
		List<Map<String, String>> list = us.getUserList();
		
		return "/user/list";
	}
	
}
