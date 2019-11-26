package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO udao;
	@Override
	public List<Map<String, String>> getUserList() {
		
		System.out.println("나는 유저");
		
		return udao.selectUserList();
	}
	
}
