package com.majon.sns_copy.feed.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.majon.sns_copy.feed.like.bo.LikeBO;

@RestController
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/feed/like")
	public Map<String,String> addLike(
			@RequestParam("feedId")int feedId,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String,String> resultMap = new HashMap<>();
		
		int count = likeBO.addLike(feedId, userId, userName);
		
		if(count==1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	@GetMapping("/like/delete")
	public Map<String,String> deleteLike(
			@RequestParam("feedId") int feedId
			,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String,String> resultMap = new HashMap<>();
		
		int count = likeBO.removeLike(feedId, userId);
		
		if(count==0) {
			resultMap.put("result", "fail");
		}else {
			resultMap.put("result", "success");
		}
		
		return resultMap;
	}
	
}
