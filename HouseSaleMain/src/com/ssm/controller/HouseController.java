package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.House;
import com.ssm.service.IHouseService;

@Controller
public class HouseController {

	@Autowired
	private IHouseService houseService;

	@RequestMapping("/house")
	public String SelectAll(HttpSession session) {
		List<House> allhouse = houseService.selectAllHouse();

		if (allhouse.isEmpty()) {

			return "fail";
		} else {
			for (House house : allhouse) {
				System.out.println(house.getH_name());
			}
			return "success2";

		}

	}

}
