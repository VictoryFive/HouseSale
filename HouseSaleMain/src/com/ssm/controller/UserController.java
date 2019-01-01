package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.Saler;
import com.ssm.bean.Buyer;
import com.ssm.service.IUserService;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping("/login") // 买家和卖家登录
	public String Login(HttpSession session, String user_username, String user_password, String user_type) {
		String name = null;
		String userType = null;
		Integer sid = null;
		if (user_type.equals("buyer")) {
			List<Buyer> buyers = userService.selectBuyer(user_username, user_password);
			if (buyers.isEmpty()) {
				return "/jsp/login.jsp";
			} else {
				for (Buyer buyer : buyers) {
					session.setAttribute("buyer", buyer);
					name = buyer.getB_name();
					session.setAttribute("name", name);
					userType = "buyer";
					session.setAttribute("userType", userType);
				}
				return "/index.jsp";
			}
		} else {
			List<Saler> salers = userService.selectSaler(user_username, user_password);
			if (salers.isEmpty()) {
				return "/jsp/login.jsp";
			} else {
				for (Saler saler : salers) {

					name = saler.getS_name();
					session.setAttribute("name", name);
					userType = "saler";
					session.setAttribute("userType", userType);
					sid = saler.getS_id();
					session.setAttribute("sid", sid);
					System.out.println(sid);
				}
				return "/index.jsp";
			}
		}

	}

	@RequestMapping("/loginout") // 注销
	public String LoginOut(HttpSession session) {
		session.removeAttribute("name");
		session.removeAttribute("userType");
		return "/index.jsp";
	}

	@RequestMapping("/register")//买家和卖家登录
	public String Register(String user_username, String user_password, String user_name, String user_telephone,
			String user_gender, Integer user_age) {
		Buyer buyer = new Buyer();
		buyer.setB_username(user_username);
		buyer.setB_password(user_password);
		buyer.setB_name(user_name);
		buyer.setB_telephone(user_telephone);
		buyer.setB_gender(user_gender);
		buyer.setB_age(user_age);

		Saler saler = new Saler();
		saler.setS_username(user_username);
		saler.setS_password(user_password);
		saler.setS_name(user_name);
		saler.setS_telephone(user_telephone);
		saler.setS_gender(user_gender);
		saler.setS_age(user_age);

		userService.saveBuyer(buyer);
		userService.saveSaler(saler);
		return "/index.jsp";
	}

	@RequestMapping("/toSearch")//搜索页面跳转
	public String ToSearch(HttpSession session) {
		return "/jsp/BuyResoldSearch.jsp";
	}

}
