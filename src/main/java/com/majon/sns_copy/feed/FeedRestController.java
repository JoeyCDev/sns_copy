package com.majon.sns_copy.feed;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.majon.sns_copy.feed.bo.FeedBO;


@RestController
@RequestMapping("/feed")
public class FeedRestController {

	@Autowired
	private FeedBO feedBO;
	
	@PostMapping("/post")
	public Map<String,String> post(
			@RequestParam("feedContent") String content
			,@RequestParam(value="feedFile", required=false) MultipartFile file
			,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		
		int count = feedBO.addFeed(userId, userName, content, file);
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(count==1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	@GetMapping("/delete")
	public Map<String,String> delete(
			@RequestParam("feedId")int feedId
			,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String,String> resultMap = new HashMap<>();
		
		int count = feedBO.deleteFeed(feedId, userId);
		
		if(count == 0) {
			resultMap.put("result", "fail");
		} else {
			resultMap.put("result", "success");
		}
		
		return resultMap;
	}
	
	
	
	
}
