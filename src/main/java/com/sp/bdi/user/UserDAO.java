package com.sp.bdi.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface UserDAO {
	public List<Map<String,String>> selectUserList();
	
}
