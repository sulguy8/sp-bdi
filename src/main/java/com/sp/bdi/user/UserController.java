package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@Autowired
	@Qualifier("UserServiceImpl")
	private UserService us; //	UserService us = new UserServiceImpl(); 이것과 같음.

	
	@RequestMapping(value = "/user/list")
	public String getUserList(Model model) {
		List<Map<String, String>> list = us.getUserList();
		model.addAttribute("list", list);
		System.out.println(model);
		return "/user/ajax";
	}
	@RequestMapping(value = "/user/ajax")
	public @ResponseBody List<UserVO> getUserList(){
		System.out.println(us.getUserVOList());
		return us.getUserVOList();
	}
	
}
