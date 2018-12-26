package com.ssm.service;

import java.util.List;

import com.ssm.bean.Buyer;

public interface IUserService {
	List<Buyer> selectAllUser();
	List<Buyer> selectBuyer(String username, String password);
	List<Buyer> selectSaler(String username,String password);
	void saveBuyer(Buyer buyer);
}	
