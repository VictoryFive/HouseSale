package com.ssm.dao;

import java.util.List;

import com.ssm.bean.Buyer;

public interface UserDao {
	List<Buyer> selectAllUser();
}
