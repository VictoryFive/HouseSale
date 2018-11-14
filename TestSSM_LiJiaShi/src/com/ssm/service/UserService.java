package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.Buyer;
import com.ssm.dao.UserDao;

@Service
public class UserService implements IUserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public List<Buyer> selectAllUser() {
		return userDao.selectAllUser();
	}
	
}
