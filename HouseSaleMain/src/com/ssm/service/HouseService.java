package com.ssm.service;

import java.util.ArrayList;
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
//下面是徐哲的
	
public List<House> find() {
		
		return houseDao.find();
	}
public List<House> find2(double[] a,double[] b) {
	   
	List<List<House>>  list=new ArrayList<List<House>>(); //存放List的List

	for(int i=0;i<a.length;i++ ){
		list.add(houseDao.find2(a[i],b[i])); //存	
				
	}
	
		for(int j=1;j<a.length;j++ ){
		
		list.get(0).addAll(list.get(j));//第一个list和其他取并集
		//list.get(0).retainAll(list.get(j));
		//
		}

	return list.get(0);
}

public List<House> find3(double[] a,double[] b) {
	   
	List<List<House>>  list=new ArrayList<List<House>>(); //存放List的List

	for(int i=0;i<a.length;i++ ){
		list.add(houseDao.find3(a[i],b[i])); //存	
				
	}
	
		for(int j=1;j<a.length;j++ ){
		
		list.get(0).addAll(list.get(j));//第一个list和其他取并集
		//list.get(0).retainAll(list.get(j));
		//
		}

	return list.get(0);
}

public List<House> find4(String[] a) {
	   
	List<List<House>>  list=new ArrayList<List<House>>(); //存放List的List

	for(int i=0;i<a.length;i++ ){
		list.add(houseDao.find4(a[i]));//存	
				
	}
	
		for(int j=1;j<a.length;j++ ){
		
		list.get(0).addAll(list.get(j));//第一个list和其他取并集
		//list.get(0).retainAll(list.get(j));
		//
		}

	return list.get(0);
}
public List<House> find5(double a1,double a2,double b1,double b2) {
	  System.out.print(houseDao.find5(a1, a2, b1, b2).size());
	

	return houseDao.find5(a1, a2, b1, b2);
}
@Override
public List<House> find6(double x, double y) {
	
	return  houseDao.find6(x,y);
}

	
}
