package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.Buyer;
import com.ssm.bean.Saler;
import com.ssm.dao.UserDao;

@Service
public class UserService implements IUserService {

	@Autowired
	private UserDao userDao;

	@Override
	public List<Buyer> selectAllUser() {
		return userDao.selectAllUser();
	}

	@Override
	public List<Buyer> selectBuyer(String username, String password) {

		return userDao.selectBuyer(username, password);
	}

	@Override
	public List<Saler> selectSaler(String username, String password) {

		return userDao.selectSaler(username, password);
	}

	@Override
	public void saveBuyer(Buyer buyer) {

		userDao.saveBuyer(buyer);

	}

	@Override
	public void saveSaler(Saler saler) {
		
		userDao.saveSaler(saler);
		
	}
	
	

}
