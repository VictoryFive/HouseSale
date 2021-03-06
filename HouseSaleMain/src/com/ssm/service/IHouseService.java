package com.ssm.service;

import java.util.List;

import com.ssm.bean.House;

public interface IHouseService {
	List<House> selectSidHouse(int sid);

	void saveHouse(House house);

	void deleteHouseByHid(int hid);

	void updateHouse(String h_name, String h_province, String h_city, String h_distric, Double h_area, String h_info,
			Double h_money, int h_id);

	List<House> searchHouse(String distric, double minarea, double maxarea, double minmoney, double maxmoney,
			String type, String RB, String EscOrDesc);
	
	//
	List<House> find();

	List<House> find2(double[] a,double[] b);
	List<House> find3(double[] a,double[] b);
	List<House> find4(String[] a);
	List<House> find5(double a1,double a2,double b1,double b2);
	List<House> find6(double x,double y);

}
