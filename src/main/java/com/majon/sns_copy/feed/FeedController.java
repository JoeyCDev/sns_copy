package com.majon.sns_copy.feed;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.majon.sns_copy.feed.bo.FeedBO;
import com.majon.sns_copy.feed.model.Feed;

@Controller
@RequestMapping("/feed")
public class FeedController {

	@Autowired
	private FeedBO feedBO;

	
	@GetMapping("/main_view")
	public String mainPage(Model model) {
		
		
		List<Feed> printFeedList = feedBO.getPost();
		
		if(printFeedList!=null) {
			model.addAttribute("printFeedList", printFeedList);
		}
		
		/*List<Comment> printCommentList = commentBO.getComment();
		
		if(printCommentList!=null) {
			model.addAttribute("printCommentList", printCommentList);
		}	
		*/
		
		return "/feed/Main";
	}
}
