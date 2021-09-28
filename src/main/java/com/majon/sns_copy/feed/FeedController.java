package com.majon.sns_copy.feed;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.majon.sns_copy.feed.bo.FeedBO;
import com.majon.sns_copy.feed.model.FeedDetail;

@Controller
@RequestMapping("/feed")
public class FeedController {

	@Autowired
	private FeedBO feedBO;
	
	@GetMapping("/main_view")
	public String mainPage(Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<FeedDetail> detailFeedList = feedBO.getFeed(userId);
		
		if(detailFeedList!=null) {
			model.addAttribute("detailFeedList", detailFeedList);
		}
		
		return "/feed/Main";
	}
}
