package com.majon.sns_copy.feed.like;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {

	@GetMapping("/feed/like")
	public Map<String,String> addLike(){
		
	}
	
}
