package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.House;
import com.ssm.dao.HouseDao;

@Service
public class HouseService implements IHouseService {

	@Autowired
	private HouseDao houseDao;

	@Override
	public List<House> selectAllHouse() {
		// TODO Auto-generated method stub
		return houseDao.selectAllHouse();
	}

}
