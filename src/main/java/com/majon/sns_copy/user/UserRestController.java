package com.majon.sns_copy.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.majon.sns_copy.model.User;
import com.majon.sns_copy.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@PostMapping("/sign_up")
	public Map<String,String> signUp(
			@RequestParam("email") String email
			,@RequestParam("name") String name
			,@RequestParam("loginId") String loginId
			,@RequestParam("password") String password){
		
		int count = userBO.insertUser(email, name, loginId, password);
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(count==1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result","fail");
		}
		
		return resultMap;
	}
	
	
	@GetMapping("/isDuplicate")
	public Map<String,Boolean>isDuplicateId(@RequestParam("loginId")String loginId){
		
		Boolean isDuplicate = userBO.isDuplicateId(loginId);
		
		Map<String,Boolean>resultMap = new HashMap<>();
		
		if(isDuplicate) {
			resultMap.put("isDuplicate", true);
		}else {
			resultMap.put("isDuplicate", false);
		}
		
		return resultMap;
		
	}
	/*
	
	@GetMapping("/isDuplicateBySubmit")
	@ResponseBody
	public Map<String,Boolean>isDuplicateBySubmit(@RequestParam("loginId")String loginId){
		
		Boolean isDuplicate = userBO.isDuplicateId(loginId);
		
		Map<String,Boolean>resultMap = new HashMap<>();
		
		if(isDuplicate) {
			resultMap.put("isDuplicate", true);
		}else {
			resultMap.put("isDuplicate", false);
		}
		
		return resultMap;
		
	}
	
	*/
	
	@PostMapping("/sign_in")
	public Map<String,String>signIn(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,HttpServletRequest request){
		
		User user = userBO.selectUser(loginId, password);
		
		Map<String,String>resultMap = new HashMap<>();
		
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
}
