package com.majon.sns_copy.feed.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.sns_copy.feed.like.model.Like;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("feedId")int feedId
			,@Param("userId")int userId
			,@Param("userName")String userName);
	
	public int selectLikeCount(int feedId);
	
	public List<Like>selectLikeList(int feedId);
}
