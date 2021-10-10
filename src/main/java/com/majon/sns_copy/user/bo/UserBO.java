package com.majon.sns_copy.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.sns_copy.common.EncryptUtils;
import com.majon.sns_copy.user.dao.UserDAO;
import com.majon.sns_copy.user.model.User;



@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	

	
	public int insertUser(String email, String name, String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		
		return userDAO.insertUser(email, name, loginId, encryptPassword);
		
	}
	
	public boolean isDuplicateId(String loginId) {
		
		int count = userDAO.countDuplicateId(loginId);
		
		if(count>=1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public User selectUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUserByIdAndPwd(loginId, encryptPassword);
		
	}
	
}
