package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.Buyer;
import com.ssm.bean.User;
import com.ssm.service.IUserService;

@Controller
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/login")
	public String login() {
		List<Buyer> AllUser = userService.selectAllUser();
		for (Buyer user : AllUser) {
			System.out.println(user.getB_name());
		}
		return "success";
	}
}
