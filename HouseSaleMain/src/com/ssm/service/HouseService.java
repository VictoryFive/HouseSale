package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.bean.House;
import com.ssm.dao.HouseDao;
import com.ssm.dao.UserDao;

@Service
public class HouseService implements IHouseService {

	@Autowired
	private HouseDao houseDao;

	@Override
	public List<House> selectSidHouse(int sid) {

		return houseDao.selectSidHouse(sid);
	}

	public void saveHouse(House house) {

		houseDao.saveHouse(house);

	}

	@Override
	public void deleteHouseByHid(int hid) {

		houseDao.deleteHouseByHid(hid);

	}

	@Override
	public void updateHouse(String h_name, String h_province, String h_city, String h_distric, Double h_area,
			String h_info, Double h_money, int h_id) {

		houseDao.updateHouse(h_name, h_province, h_city, h_distric, h_area, h_info, h_money, h_id);

	}

	@Override
	public List<House> searchHouse(String distric, double minarea, double maxarea, double minmoney, double maxmoney,
			String type, String RB, String EscOrDesc) {

		return houseDao.searchHouse(distric, minarea, maxarea, minmoney, maxmoney, type, RB, EscOrDesc);
	}

}
