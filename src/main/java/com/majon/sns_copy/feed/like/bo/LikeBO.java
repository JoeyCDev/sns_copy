package com.majon.sns_copy.feed.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.sns_copy.feed.like.dao.LikeDAO;


@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int feedId, int userId, String userName) {
		
		return likeDAO.insertLike(feedId, userId, userName);
		
	}
	
	public int countLike(int feedId) {
		return likeDAO.selectLikeCount(feedId);
	}
	
	public boolean isLikedByfeedIdAndUserId(int feedId, int userId) {
		int count = likeDAO.selectLikeListByfeedIdAndUserId(feedId, userId);
		if(count>=1) {
			return true;
		}else {
			return false;
		}
	}
	
	public int removeLike(int feedId, int userId) {
		return likeDAO.deleteLike(feedId, userId);
	}

}
