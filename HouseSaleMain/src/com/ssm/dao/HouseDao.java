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
	
	List<House> find();
	List<House> find2(double a,double b);
	List<House> find3(double a,double b);
	List<House> find4(String a);
	List<House> find5(double a1,double a2,double b1,double b2);
	List<House> find6(double x,double y);
	
	
//≤‚ ‘
	/*List<House> find2();
	List<House> find8(double a,double b);
	List<House> find4(double a,double b);
	List<House> find5(String a);
	List<House> find6(double a1,double a2,double b1,double b2);
	List<House> find7(double x,double y);*/
	
	
	
	
}
