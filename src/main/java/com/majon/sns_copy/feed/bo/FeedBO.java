package com.majon.sns_copy.feed.bo;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.majon.sns_copy.common.FileManagerService;
import com.majon.sns_copy.feed.dao.FeedDAO;
import com.majon.sns_copy.feed.model.Feed;

@Service
public class FeedBO {

	@Autowired
	private FeedDAO feedDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
			
			String imagePath = null;
			if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			if(imagePath == null) {
				return 0;
			}
		}
			
			
			return feedDAO.insertPost(userId, userName, content, imagePath);
		}
	public List<Feed> getPost(){
		return feedDAO.selectPost();
	}
	
	
	
}
