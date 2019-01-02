package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.bean.House;

public interface HouseDao {
	List<House> selectSidHouse(int sid);

	void saveHouse(House house);

	void deleteHouseByHid(int hid);

	void updateHouse(String h_name, String h_province, String h_city, String h_distric, Double h_area, String h_info,
			Double h_money, int h_id);

	List<House> searchHouse(@Param(value = "distric") String distric, @Param(value = "minArea") double minarea,
			@Param(value = "maxArea") double maxarea, @Param(value = "minMoney") double minmoney,
			@Param(value = "maxMoney") double maxmoney, @Param(value = "type") String type,
			@Param(value = "RB") String RB, @Param(value = "EscOrDesc") String EscOrDesc);
}
