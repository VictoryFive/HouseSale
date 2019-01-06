package com.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.bean.House;
import com.ssm.service.IHouseService;

@Controller
public class HouseController {

	@Autowired
	private IHouseService houseService;

	public String Createuuid() {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		String uuidStr = str.replace("-", "");
		return uuidStr;

	}

	@RequestMapping("/saleHouse")
	public String saleHouse(HttpSession session, HttpServletRequest request) {
		String house_name = null;
		String house_province = null;
		String house_city = null;
		String house_distric = null;
		String house_design = null;
		String house_RB = null;
		Double house_money = null;
		Double house_area = null;

		String house_type = null;
		String house_url = null;
		String house_info = null;
		Double house_x = null;
		Double house_y = null;

		// 获取工厂，设置缓存大小与临时目录
		DiskFileItemFactory factory = new DiskFileItemFactory(20 * 1024, new File("F:/temp"));
		// 获取解析器，设置数据大小限制
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024 * 1024 * 1024);// 设置单个文件的限制大小
		sfu.setSizeMax(1024 * 1024 * 1024);// 设置整个表单数据的大小限制
		// 解析得到LIST，遍历文件
		try {
			List<FileItem> list = sfu.parseRequest(request);
			FileItem fileItem0 = list.get(0);
			FileItem fileItem1 = list.get(1);
			FileItem fileItem2 = list.get(2);
			FileItem fileItem3 = list.get(3);
			FileItem fileItem4 = list.get(4);
			FileItem fileItem5 = list.get(5);
			FileItem fileItem6 = list.get(6);
			FileItem fileItem7 = list.get(7);
			FileItem fileItem8 = list.get(8);
			FileItem fileItem9 = list.get(9);
			FileItem fileItem10 = list.get(10);
			FileItem fileItem11 = list.get(11);
			FileItem fileItem12 = list.get(12);
			house_name = fileItem0.getString("utf-8");
			house_province = fileItem1.getString("utf-8");
			house_city = fileItem2.getString("utf-8");
			house_distric = fileItem3.getString("utf-8");
			house_design = fileItem4.getString("utf-8");
			house_RB = fileItem5.getString("utf-8");
			house_money = Double.parseDouble(fileItem6.getString("utf-8"));
			house_area = Double.parseDouble(fileItem7.getString("utf-8"));
			house_type = fileItem8.getString("utf-8");
			house_info = fileItem10.getString("utf-8");
			house_x = Double.parseDouble(fileItem11.getString("utf-8"));
			house_y = Double.parseDouble(fileItem12.getString("utf-8"));
			// 得到文件的保存路径
			String root = request.getServletContext().getRealPath("/static/images/");
			// 生成二级目录
			String filename = fileItem9.getName();
			// 处理文件名为绝对路径的问题
			int index = filename.lastIndexOf("\\");
			if (index != -1) {
				filename = filename.substring(index + 1);
			}
			// 给文件名字添加UUID，防止同名文件
			String savename = Createuuid() + "_" + filename;
			// 得到HASHCODE
			int hashCode = filename.hashCode();
			String hex = Integer.toHexString(hashCode);
			// 获取hex的前两个字符，与root连在一起生成一个完整的路径
			File dirFile = new File(root, hex.charAt(0) + "/" + hex.charAt(1));
			// 创建目录
			dirFile.mkdirs();
			// 创建最后的目标文件名，病连起来形成最后路径
			File destFile = new File(dirFile, savename);
			house_url = destFile.toString().substring(destFile.toString().indexOf("\\static")).replaceAll("\\\\", "/");
			System.out.println(house_url);
			fileItem9.write(destFile);
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		Integer year = cal.get(Calendar.YEAR);
		Integer month = cal.get(Calendar.MONTH) + 1;
		Integer day = cal.get(Calendar.DATE);
		String house_date = year.toString() + "/" + month.toString() + "/" + day.toString();
		House house = new House();
		house.setH_name(house_name);
		house.setH_province(house_province);
		house.setH_city(house_city);
		house.setH_distric(house_distric);
		house.setH_design(house_design);
		house.setH_RB(house_RB);
		house.setH_money(house_money);
		house.setH_area(house_area);
		house.setH_type(house_type);
		house.setH_url(house_url);
		house.setH_info(house_info);
		house.setH_date(house_date);
		house.setH_x(house_x);
		house.setH_y(house_y);
		Integer s_id = (Integer) session.getAttribute("sid");
		house.setS_id(s_id);
		houseService.saveHouse(house);
		return "/jsp/salerOfHouse.jsp";
	}

	@RequestMapping("/rentHouse")
	public String rentHouse(HttpSession session, HttpServletRequest request) {
		String house_name = null;
		String house_province = null;
		String house_city = null;
		String house_distric = null;
		String house_design = null;
		String house_date = null;
		String house_RB = null;
		Double house_money = null;
		Double house_area = null;
		String house_type = null;
		String house_url = null;
		String house_info = null;
		Double house_x = null;
		Double house_y = null;
		// 获取工厂，设置缓存大小与临时目录
		DiskFileItemFactory factory = new DiskFileItemFactory(20 * 1024, new File("F:/temp"));
		// 获取解析器，设置数据大小限制
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024 * 1024 * 1024);// 设置单个文件的限制大小
		sfu.setSizeMax(1024 * 1024 * 1024);// 设置整个表单数据的大小限制
		// 解析得到LIST，遍历文件
		try {
			List<FileItem> list = sfu.parseRequest(request);
			FileItem fileItem0 = list.get(0);
			FileItem fileItem1 = list.get(1);
			FileItem fileItem2 = list.get(2);
			FileItem fileItem3 = list.get(3);
			FileItem fileItem4 = list.get(4);
			FileItem fileItem5 = list.get(5);
			FileItem fileItem6 = list.get(6);
			FileItem fileItem7 = list.get(7);
			FileItem fileItem8 = list.get(8);
			FileItem fileItem9 = list.get(9);
			FileItem fileItem10 = list.get(10);
			FileItem fileItem11 = list.get(11);
			FileItem fileItem12 = list.get(12);
			FileItem fileItem13 = list.get(13);
			house_name = fileItem0.getString("utf-8");
			house_province = fileItem1.getString("utf-8");
			house_city = fileItem2.getString("utf-8");
			house_distric = fileItem3.getString("utf-8");
			house_design = fileItem4.getString("utf-8");
			house_date = fileItem5.getString("utf-8");
			house_RB = fileItem6.getString("utf-8");
			house_money = Double.parseDouble(fileItem7.getString("utf-8"));
			house_area = Double.parseDouble(fileItem8.getString("utf-8"));
			house_type = fileItem9.getString("utf-8");
			house_info = fileItem11.getString("utf-8");
			house_x = Double.parseDouble(fileItem12.getString("utf-8"));
			house_y = Double.parseDouble(fileItem13.getString("utf-8"));
			// 得到文件的保存路径
			String root = request.getServletContext().getRealPath("/static/images/");
			// 生成二级目录
			String filename = fileItem10.getName();
			// 处理文件名为绝对路径的问题
			int index = filename.lastIndexOf("\\");
			if (index != -1) {
				filename = filename.substring(index + 1);
			}
			// 给文件名字添加UUID，防止同名文件
			String savename = Createuuid() + "_" + filename;
			// 得到HASHCODE
			int hashCode = filename.hashCode();
			String hex = Integer.toHexString(hashCode);
			// 获取hex的前两个字符，与root连在一起生成一个完整的路径
			File dirFile = new File(root, hex.charAt(0) + "/" + hex.charAt(1));
			// 创建目录
			dirFile.mkdirs();
			// 创建最后的目标文件名，病连起来形成最后路径
			File destFile = new File(dirFile, savename);
			house_url = destFile.toString().substring(destFile.toString().indexOf("\\static")).replaceAll("\\\\", "/");
			System.out.println(house_url);
			fileItem10.write(destFile);
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		House house = new House();
		house.setH_name(house_name);
		house.setH_province(house_province);
		house.setH_city(house_city);
		house.setH_distric(house_distric);
		house.setH_design(house_design);
		house.setH_date(house_date);
		house.setH_RB(house_RB);
		house.setH_money(house_money);
		house.setH_area(house_area);
		house.setH_type(house_type);
		house.setH_url(house_url);
		house.setH_info(house_info);
		house.setH_x(house_x);
		house.setH_y(house_y);
		Integer s_id = (Integer) session.getAttribute("sid");
		house.setS_id(s_id);
		houseService.saveHouse(house);
		return "/jsp/salerOfHouse.jsp";
	}

	@RequestMapping("/findSalerOfHouse")
	@ResponseBody
	public List<House> FindSalerOfHouse(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Integer sid = (Integer) session.getAttribute("sid");
		List<House> houses = houseService.selectSidHouse(sid);
		return houses;
	}

	@RequestMapping("/deleteSalerOfHouse")
	public String DeleteSalerOfHouse(Integer hid) throws IOException {
		System.out.println(hid);
		houseService.deleteHouseByHid(hid);
		return "/jsp/salerOfHouse.jsp";
	}

	@RequestMapping("/updateHouse")
	public String UpdateHouse(Integer h_id, String h_name, String h_province, String h_city, String h_distric,
			Double h_area, String h_info, Double h_money, HttpServletRequest reqeust) {
		houseService.updateHouse(h_name, h_province, h_city, h_distric, h_area, h_info, h_money, h_id);
		return "/jsp/salerOfHouse.jsp";
	}

	@RequestMapping("/ajaxhouse")
	@ResponseBody
	public Map<String, Object> ajaxInfoList(HttpServletRequest request, HttpSession session) {
		System.out.println("login");
		double minmoney, maxmoney, minarea, maxarea;
		String distric = request.getParameter("distric");
		String RB = request.getParameter("RB");
		String EscORDesc = request.getParameter("EscORDesc");
		if (request.getParameter("minmoney") == "") {
			minmoney = 0;
		} else {
			minmoney = Double.parseDouble(request.getParameter("minmoney"));
		}
		if (request.getParameter("maxmoney") == "") {
			maxmoney = 0;
		} else {
			maxmoney = Double.parseDouble(request.getParameter("maxmoney"));

		}
		if (request.getParameter("minarea") == "") {
			minarea = 0;
		} else {
			minarea = Double.parseDouble(request.getParameter("minarea"));
		}
		if (request.getParameter("maxarea") == "") {
			maxarea = 0;
		} else {
			maxarea = Double.parseDouble(request.getParameter("maxarea"));
		}
		String type = request.getParameter("types");
		Map<String, Object> mp = new HashMap<String, Object>();

		List<House> list = houseService.searchHouse(distric, minarea, maxarea, minmoney, maxmoney, type, RB, EscORDesc);

		if (list.isEmpty()) {
			mp.put("msg", "fail");
			return mp;

		} else {

			mp.put("msg", list);
			return mp;

		}

	}

}
