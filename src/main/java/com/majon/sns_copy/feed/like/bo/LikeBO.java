package com.majon.sns_copy.feed.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.sns_copy.feed.like.dao.LikeDAO;
import com.majon.sns_copy.feed.like.model.Like;

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
		if(likeDAO.selectLikeListByfeedIdAndUserId(feedId, userId)>=1) {
			return true;
		}else {
			return false;
		}
	}

}
