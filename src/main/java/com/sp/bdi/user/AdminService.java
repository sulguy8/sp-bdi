package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdminService")
public class AdminService implements UserService {
	@Autowired
	UserDAO udao;
	@Override
	public List<Map<String, String>> getUserList() {
		
		System.out.println("나는 어드민");
		
		return udao.selectUserList();
	}

}
