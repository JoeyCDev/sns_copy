package com.majon.sns_copy.feed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.majon.sns_copy.feed.bo.FeedBO;
import com.majon.sns_copy.model.Comment;
import com.majon.sns_copy.model.Feed;

@Controller
@RequestMapping("/feed")
public class FeedController {

	@Autowired
	private FeedBO feedBO;
	
	@GetMapping("/main_view")
	public String mainPage(Model model) {
		
		// 피드 리스트
		List<Feed> printFeedList = feedBO.getPost();
		
		// comment 리스트
		List<Comment> printCommentList = feedBO.getComment();
		
		if(printFeedList!=null) {
			model.addAttribute("printFeedList", printFeedList);
		}
		
		if(printCommentList!=null) {
			model.addAttribute("printCommentList", printCommentList);
		}
			
		return "/feed/Main";
	}
}
