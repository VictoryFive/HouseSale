package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.Buyer;
import com.ssm.service.IUserService;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping("/login")
	public String login(HttpSession session, String username, String password) {
		String name = null;
		int age = 0;
		String gender = null;

		List<Buyer> AllUser = userService.selectBuyer(username, password);
		if (AllUser.isEmpty()) {
			return "fail";
		} else {
			for (Buyer buyer : AllUser) {
				name = buyer.getB_name();
				session.setAttribute("name", name);
				age = buyer.getB_age();
				session.setAttribute("age", age);
				gender = buyer.getB_gender();
				session.setAttribute("gender", gender);
			}
			return "success";
		}

	}

	@RequestMapping("/register")
	
	public String Register(String username, String password, String name, String telephone, String gender,
			Integer age) {
		Buyer buyer = new Buyer();
		buyer.setB_username(username);
		buyer.setB_password(password);
		buyer.setB_name(name);
		buyer.setB_telephone(telephone);
		buyer.setB_gender(gender);
		buyer.setB_age(age);

		userService.saveBuyer(buyer);

		System.out.println("注册成功！");

		return "success";

	}

}
