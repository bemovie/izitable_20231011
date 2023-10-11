package com.izitable.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.izitable.dao.UserDao;
import com.izitable.model.User;
import com.izitable.model.Pager;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Override
	public List<User> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void update(User item) {
		dao.update(item);
	}

	@Override
	public void delete(int userNo) {
		dao.delete(userNo);
	}

	@Override
	public void add(User item) {
		
		item.setUserPhoneCert("0"); //전화번호 인증 : 미인증 -0, 인증-1
		
		dao.add(item);
	}

	@Override
	public Boolean login(User user) {
		User result = dao.login(user);
		
		if (result != null) {
			BeanUtils.copyProperties(result, user);
			user.setUserPwd(null);
			
			return true;
		}
		return false;	
	}

	@Override
	public User item(int userNo) {
		return dao.item(userNo);
	}

}
