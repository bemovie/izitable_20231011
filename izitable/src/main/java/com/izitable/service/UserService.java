package com.izitable.service;

import java.util.List;

import com.izitable.model.User;
import com.izitable.model.Pager;

public interface UserService {

	List<User> list(Pager pager);

	void update(User item);

	void delete(int userNo);

	void add(User item);

	Boolean login(User user);

	User item(int userNo);

}
