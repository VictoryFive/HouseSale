package com.ssm.dao;

import java.util.List;

import com.ssm.bean.Buyer;
import com.ssm.bean.Saler;

public interface UserDao {
	List<Buyer> selectAllUser();
	List<Buyer> selectBuyer(String username,String password);
	List<Saler> selectSaler(String username,String password);
	void saveBuyer(Buyer buyer);
	void saveSaler(Saler saler);
}
